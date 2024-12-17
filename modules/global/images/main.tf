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

# resource "libvirt_pool" "project_images_pool" {
# #  name = "${var.prefix}-pool"
#   name = "${var.project}-images"
#   type = "dir"
#   target {
#     path = "${local.full_project_pool_path}/images"  
#   }
# }

# resource "libvirt_volume" "image" {
#   name   = var.image.name
#   format = "qcow2"
#   pool   = libvirt_pool.project_images_pool.name
#   source = var.image.url
# }

resource "libvirt_volume" "images" {
    for_each = { for each in var.images : each.name => each }
    name    = each.value.name
    format  = "qcow2"
    pool    = var.project_images_pool
    source  = each.value.url
}