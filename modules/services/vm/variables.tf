# variable "vm_prefix_name" {
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

variable "custom_user_data" {
  description = "Used for passing to module's user_data (cloud-init.cfg template)"
}

variable "project_images_pool_name" {
  type = string
}

variable "ansible_playbook_name" {
  type = string
  description = "Parameterize the name of the Ansible script"
  # somthing like Debian12-PrepareNewHost.yml
}
