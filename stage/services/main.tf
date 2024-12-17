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

resource "libvirt_pool" "pool" {
  name = "${var.prefix}-pool"
  type = "dir"
#  path = "${var.pool_path}${var.prefix}pool"
  target {
    path = "${var.pool_path}${var.prefix}-${var.vm.name}-pool"  
  }
}

resource "libvirt_volume" "image" {
  name   = var.image.name
  format = "qcow2"
  pool   = libvirt_pool.pool.name
  source = var.image.url
}

resource "libvirt_volume" "system_disk" {
  name           = "${var.prefix}_disk_1"
  pool           = libvirt_pool.pool.name
  base_volume_id = libvirt_volume.image.id
  size           = var.vm.disk
}

resource "libvirt_domain" "vm" {
  name   = var.vm.name
  memory = var.vm.ram
  vcpu   = var.vm.cpu

  network_interface {
    bridge         = var.vm.bridge
    wait_for_lease = true
  }

  disk {
    volume_id = libvirt_volume.system_disk.id
  }
}