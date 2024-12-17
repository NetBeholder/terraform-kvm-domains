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

