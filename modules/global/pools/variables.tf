variable "project" {
  type    = string
  default = "my-amazing-project"
}
# Префикс для создаваемых объектов
# variable "prefix" {
#   type    = string
#   default = "vm"
# }
variable "base_project_pool_path" {
  type    = string
  default = "/var/lib/libvirt"
}


# locals {
#   full_project_pool_path  = "${var.base_project_pool_path}/${var.project}"
#   full_project_dev_pool_path   = "${var.base_project_pool_path}/${var.project}/dev"
#   full_project_stage_pool_path = "${var.base_project_pool_path}/${var.project}/stage"
#   full_project_prod_pool_path   = "${var.base_project_pool_path}/${var.project}/prod"
# }

variable "pool_name" {
  type = string
  }

variable "pool_target_path" {
  type = string
}


# variable "pool" {
#   type = object({
#     name = string
#     path = string
#   })
# }
