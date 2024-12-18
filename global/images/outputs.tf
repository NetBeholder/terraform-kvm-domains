# list
# output "project_parent_images" {
#   value = [ for i in module.project_images : i.project_parent_images ]
# }

# map
output "project_parent_images" {
  value = {
    for k, image in module.project_images : k => image.project_parent_images
  }
}