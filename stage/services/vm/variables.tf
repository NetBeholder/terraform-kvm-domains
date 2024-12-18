variable "ansible_playbook_name" {
  type = string
}

variable "vm" {
  type = object({
    name        = string
    cpu         = number
    ram         = number
    disk_size   = number
    bridge      = string
    autostart   = string
  })
}

variable "vms" {
  type    = list(object({
    name        = string
    cpu         = number
    ram         = number
    disk_size   = number
    bridge      = string
    autostart   = string
  }))
}

locals {
  libvirt_uri  = "${data.terraform_remote_state.global_vars.outputs.libvirt_uri["my_host"]}"
  project_name = "${data.terraform_remote_state.global_vars.outputs.project_name}"
}