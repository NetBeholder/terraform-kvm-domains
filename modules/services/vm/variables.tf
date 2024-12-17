# Префикс для создаваемых объектов
# variable "vm_name_prefix" {
#   type    = string
#   default = "vm"
# }
variable "pool_name" {
  type = string
}

variable "base_image_id" {
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

#cloud init 
# variable "custom_user_data" {
#   type = object({
#     rendered = string
#   })
# }

# }
variable "custom_user_data" {
  description = "Used for passing to module's user_data (cloud-init.cfg template)"
}

# variable "ansible_playbook_data" {

# }

variable "project_images_pool_name" {
  type = string
}

variable "ansible_playbook_name" {
  type = string
  description = "Parameterize the name of the Ansible script"
  # somthing like Debian12-PrepareNewHost.yml
}

# locals {
#   ansible_playbook_scenario = var.ansible_playbook_data
# }
