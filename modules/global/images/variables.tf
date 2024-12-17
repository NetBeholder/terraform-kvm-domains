variable "project" {
  type    = string
  default = "my-amazing-project"
}
# Префикс для создаваемых объектов
# variable "prefix" {
#   type    = string
#   default = "vm"
# }

locals {
  full_project_pool_path = "${var.base_project_pool_path}/${var.project}"
}

# Путь, где будет хранится пул проекта
variable "base_project_pool_path" {
  type    = string
  default = "/var/lib/libvirt"
}

# variable "image" {
#   type = object({
#     name = string
#     url  = string
#   })
# }

variable "project_images_pool" {
  type = string
}

variable "images" {
  type    = list(object({
    name  = string
    url   = string
  }))
}