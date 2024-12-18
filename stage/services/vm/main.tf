terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}

provider "libvirt" {
  uri = local.libvirt_uri
}

data "terraform_remote_state" "global_vars" {
  backend = "local"
  config = {
    path = "../../../global/vars/terraform.tfstate"
  }
}

data "terraform_remote_state" "images" {
  backend = "local"
  config = {
    path = "../../../global/images/terraform.tfstate"
  }
}

data "terraform_remote_state" "pools" {
  backend = "local"
  config = {
    path = "../../../global/pools/terraform.tfstate"
  }
}

module "project_domains" {
  source = "../../../modules/services/vm"
  project_images_pool_name   = "${data.terraform_remote_state.pools.outputs.project_pools["${local.project_name}-images"].name}"
  for_each = { for each in var.vms : each.name => each }
  base_image_id = "${data.terraform_remote_state.images.outputs.project_parent_images["debian-12-generic-amd64.qcow2"].id}"
  # this stage pool
  pool_name = "${data.terraform_remote_state.pools.outputs.project_pools["${local.project_name}-stage"].name}"
  # vm vars
  vm = each.value
  custom_user_data = file("${path.module}/cloud_init.cfg")
  ansible_playbook_name = var.ansible_playbook_name
}

