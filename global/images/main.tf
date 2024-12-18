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

data "terraform_remote_state" "pools" {
  backend = "local"
  config = {
    path = "../pools/terraform.tfstate"
  }
}


# output "project_images_pool" {
#   value = module.project_pools["${var.project}-images"].project_pools
# }

module "project_images" {
  source                        = "../../modules/global/images"
#  project                       = "test-project"
#  project_images_pool   = "${data.terraform_remote_state.pools.outputs.project_images_pool.name}"
#  project_images_pool_name   = "${data.terraform_remote_state.pools.outputs.project_images_pool.name}"
  project_images_pool_name   = "${data.terraform_remote_state.pools.outputs.project_pools["${var.project}-images"].name}"


#  base_project_pool_path = "/media/LocalStorage/VMs"
  for_each = { for each in var.images : each.name => each }
  image = {
      name    = each.value.name
      url     = each.value.url
  }
#  images = var.images

#   image = {
#     name = "debian-12-genericcloud-amd64.qcow2"
#     url = "https://cdimage.debian.org/images/cloud/bookworm/latest/debian-12-genericcloud-amd64.qcow2"
#   }
  

}