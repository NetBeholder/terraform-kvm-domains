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
    path = "../vars/terraform.tfstate"
  }
}

data "terraform_remote_state" "pools" {
  backend = "local"
  config = {
    path = "../pools/terraform.tfstate"
  }
}

module "project_images" {
  source                     = "../../modules/global/images"
  #define as global?
  project_images_pool_name   = "${data.terraform_remote_state.pools.outputs.project_pools["${local.project_name}-images"].name}"
  for_each = { for each in var.images : each.name => each }
  image = {
      name    = each.value.name
      url     = each.value.url
  }
}