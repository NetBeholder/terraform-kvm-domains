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

module "project_pools" {
  source                 = "../../modules/global/pools"
  project                = var.project
  base_project_pool_path = var.base_project_pool_path 
  for_each = { for each in local.project_pools : each.name => each }
  pool_name = each.value.name
  pool_target_path = each.value.path
}