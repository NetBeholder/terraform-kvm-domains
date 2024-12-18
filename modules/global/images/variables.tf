variable "image" {
  type = object({
    name = string
    url  = string
  })
}

variable "project_images_pool_name" {
  type = string
}

# variable "images" {
#   type    = list(object({
#     name  = string
#     url   = string
#   }))
# }