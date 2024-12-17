prefix = "vm"

pool_path = "/media/LocalStorage/VMs/"

image = {
  name = "ubuntu-focal"
#  url  = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64-disk-kvm.img"
  url = "https://cdimage.debian.org/images/cloud/bookworm/latest/debian-12-genericcloud-amd64.qcow2"
}

vm = {
  bridge = "nm-br.16"
  cpu    = 1
  disk   = 10 * 1024 * 1024 * 1024
  ram    = 1024
  name   = "test-vm"
}