variable "images" {
  type = list(object({
    name    = string
    url     = string
  }))
}

variable "project" {
  type = string
}