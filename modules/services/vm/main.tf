terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}

resource "libvirt_volume" "vm_system_disk" {
  name           = "${var.vm.name}_disk_1.qcow2"
#  pool           = libvirt_pool.pool.name
  pool           = "${var.pool_name}"
#  base_volume_id = libvirt_volume.image.id
  base_volume_id = "${var.base_image_id}"
  size           = var.vm.disk_size
}

resource "libvirt_cloudinit_disk" "commoninit" {
  name      = "commoninit-${var.vm.name}.iso"
  pool      = "${var.project_images_pool_name}"
  user_data = data.template_file.user_data.rendered
#  user_data = "${var.custom_user_data.rendered}"

}

 data "template_file" "user_data" {
#  template = file("${path.module}/cloud_init.cfg")
   template = "${var.custom_user_data}"
   vars = {
     hostname = "${var.vm.name}" 
   }
}

resource "libvirt_domain" "vm" {
  name      = var.vm.name
  memory    = var.vm.ram
  vcpu      = var.vm.cpu
  autostart = var.vm.autostart

  network_interface {
    bridge         = var.vm.bridge
    wait_for_lease = true
  }

  disk {
    volume_id = libvirt_volume.vm_system_disk.id
  }
  
  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }
  cloudinit = libvirt_cloudinit_disk.commoninit.id
  qemu_agent = true
}

# ansible
resource "null_resource" "run_ansible_playbook" {
#  count = length(cherryservers_server.demo-servers)

  # we wait until the ssh daemon rises...
  provisioner "local-exec" {
    command     = "until nc -zv ${libvirt_domain.vm.network_interface[0].addresses.0} 22; do echo 'Waiting for SSH to be available...'; sleep 5; done"
    working_dir = path.module
  }

  provisioner "local-exec" {
  #   command     = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i '$IP,' -u root --private-key //Path_to_private_key ./ansible/playbook.yml"
    # we need to think about how to replace the password with a more suitable mechanism. Now this same password is set through cloud init
    command     = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i '${libvirt_domain.vm.network_interface[0].addresses.0},' -u root -e 'ansible_password=P@ssw0rd' ${path.cwd}/ansible/${var.ansible_playbook_name}"
     # data.template_file.ansible_playbook.rendered"
    # --private-key //Path_to_private_key ./ansible/playbook.yml"
    working_dir = path.module
  }
}

#  user_data = data.template_file.user_data.rendered
#  user_data = "${var.custom_user_data.rendered}"

#}

#  data "template_file" "ansible_playbook" {
# #  template = file("${path.module}/cloud_init.cfg")
#    template = "${var.ansible_playbook_data}"
#   vars = {
#     hostname = "${var.vm.name}" 
#   }
# }

# resource "local_file" "ansible_playbook_file" {
#   filename = "ansible_playbook_${var.vm.name}.yml"
#   content  = local.ansible_playbook_scenario
# }