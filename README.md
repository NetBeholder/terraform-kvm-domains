# QEMU-KVM Domains (virtual machines) provisioning with Terraform (and Ansible)
Automated virtual machines creation with Terraform, Cloud-init and Ansible.

# Introduction
Designed to apply the Infrastructure-as-Code approach to creating and configuring virtual machines (domains) of the KEMU-KVM hypervisor.
## Current status
- Still being tested
- Suitable for use in test environments
## Features
Under the hood, the following technologies and tools are used:
* Terraform
* Ansible
* Cloud Linux images (with Cloud-init and netplan)
* nc (netcat)
* ssh
* and, of course, the QEMU-KVM host itself
## Notes
When using in production, always remember about operational security. Passwords should not be stored in plaintext. You should also take care of the locking mechanism and remote Terraform backends.
# Table of contents
0. [Introduction](#introduction)
    1. [Current status](#current-status)
    2. [Features](#features)
    3. [Notes](#notes)
1. [Basic concepts](#basic-concepts)
    1. [Directory structures](#directory-structure)
    2. [Sequence of deployment steps](#sequence-of-deployment-steps)
2. [How to run](#how-to-run)
3. [Refs](#refs)
# Basic concepts
* State files isolation. Isolating Terraform project state files with directory structure.
* Modules. The code was structured using modules for maximum flexibility and reproducibility.
* Separate the sheep from the goats. Environment creation (e.g. stage) is separated from KVM level settings (pools creation) and dependencies needed to create virtual machines (OS image downloads).
## Directory structure
Let's look at the folder structure.
At the highest level there are separate folders for each "environment" and a common resource for all environments.
* *global* (creates pools and download images)
  * images
  * pools
* *modules* (stores code that is reused by other resources)
  * global
    * images
    * pools
  * services
    * vm
* *stage* (creates resources of stage environment)
  * services
    * vm
      * ansible
* (prod)
  * (bla-bla)
    * (bla-bla-bla)

So, at the moment, on the stage/services/vm path there is a script that creates virtual machines (one or more) running Debian 12 GNU/Linux OS.
Let's say, for example, we need to automate the deployment of virtual machines with the CentOS GNU/Linux OS. So, by analogy, we will create a directory structure 'stage/services/vm-centos' or even 'stage/services/vm/vm-centos' and add the necessary code there. Next, you need to take into account the specifics of configuring this OS in the corresponding Ansible playbook, the cloud-init configuration file, and do not forget to take into account loading the required OS image (terraform is responsible for these resources in global/images)
## Sequence of deployment steps
1. KVM pools.
2. Loading the used OS images.
3. Virtual Machines:
   1. KVM Domain (with a qcow-2 type disk cloned from the parent image)
   2. Cloud-init (early OS configuration stage)
   3. Ansible (late OS configuration stage)
# How to run
First, you need to be able to connect to the KVM host without a password, for example, using a SSH key if it is a remote host.
Alternatively, the key can be specified explicitly in the URI:
uri = "qemu+ssh://user@host/system?keyfile=${PATH_TO_KEY}/id_rsa"

Then run from global/pools directory:
```shell
terraform init
terraform plan
terraform apply
```
run from global/images directory:
```bash
terraform init
terraform plan
terraform apply
```
run from stage/services/vm directory:
```bash
terraform init
terraform plan
terraform apply
```
# Refs
0. https://registry.terraform.io/providers/dmacvicar/libvirt/latest/docs
1. https://libvirt.org/uri.html
2. https://blog.ionice.ru/terraform-kvm-part1
3. https://www.cherryservers.com/blog/terraform-and-ansible
4. https://dev.to/ruanbekker/terraform-with-kvm-2d9e
5. https://www.reddit.com/r/Proxmox/comments/1gujajr/first_boot_always_result_in_kernel_panic_on_new/
