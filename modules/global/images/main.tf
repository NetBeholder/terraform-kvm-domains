terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}

resource "libvirt_volume" "image" {
    name    = var.image.name 
    format  = "qcow2"
    pool    = var.project_images_pool_name
    source  = var.image.url
}