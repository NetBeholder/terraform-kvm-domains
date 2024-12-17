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
  source         = "../../modules/global/pools"
  project        = "test-project"
  base_project_pool_path = "/media/LocalStorage/VMs"
#   for_each = { for each in var.images : each.name => each }
#   image = {
#     name    = each.value.name
#     url     = each.value.url
#   }


#   image = {
#     name = "debian-12-genericcloud-amd64.qcow2"
#     url = "https://cdimage.debian.org/images/cloud/bookworm/latest/debian-12-genericcloud-amd64.qcow2"
#   }
}