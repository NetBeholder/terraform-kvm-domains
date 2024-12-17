terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}

# resource "libvirt_pool" "project_pool" {
# #  name = "${var.prefix}-pool"
#   name = "${var.project}"
#   type = "dir"
#   target {
#     path = "${local.full_project_pool_path}"  
#   }
# }

resource "libvirt_pool" "project_images_pool" {
#  name = "${var.prefix}-pool"
  name = "${var.project}-images"
  type = "dir"
  target {
    path = "${local.full_project_pool_path}/images"  
  }
}

resource "libvirt_pool" "project_stage_pool" {
#  name = "${var.prefix}-pool"
  name = "${var.project}-stage"
  type = "dir"
  target {
    path = "${local.full_project_pool_path}/stage"  
  }
}