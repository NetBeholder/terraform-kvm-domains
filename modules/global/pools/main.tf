terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}

resource "libvirt_pool" "pool" {
  name = "${var.pool_name}"
  type = "dir"
  target {
    path = "${var.pool_target_path}"
  }
}