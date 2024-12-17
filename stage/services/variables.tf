# Префикс для создаваемых объектов
variable "prefix" {
  type    = string
  default = "vm"
}

# Путь, где будет хранится пул проекта
variable "pool_path" {
  type    = string
  default = "/var/lib/libvirt/"
}

# Параметры облачного образа
variable "image" {
  type = object({
    name = string
    url  = string
  })
}

# Параметры виртуальной машины
variable "vm" {
  type = object({
    name   = string
    cpu    = number
    ram    = number
    disk   = number
    bridge = string
  })
}