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

module "project_pools" {
  source                 = "../../modules/global/pools"
  base_project_pool_path = var.base_project_pool_path 
  for_each = { for each in local.project_pools : each.name => each }
  pool_name = each.value.name
  pool_target_path = each.value.path
}