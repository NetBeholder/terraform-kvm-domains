terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}

provider "libvirt" {
  uri = "qemu+ssh://sergey@192.168.16.10/system"
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

#foreach through array of VM objects
module "project_vm" {
  source = "../../../modules/services/vm"
  project_images_pool_name   = "${data.terraform_remote_state.pools.outputs.project_images_pool.name}"
  for_each = { for each in var.vms : each.name => each }
  # volume vars
  base_image_id = "${data.terraform_remote_state.images.outputs.debian-12-generic-image.id}"
  pool_name = "${data.terraform_remote_state.pools.outputs.project_stage_pool.name}"
  # vm vars
  vm = each.value
  custom_user_data = file("${path.module}/cloud_init.cfg")
  ansible_playbook_name = var.ansible_playbook_name
}

