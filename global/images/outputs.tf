#  base_volume_id = libvirt_volume.image.id
#  output "volume_id" {
#    value = "${module.project_images.volume_id}"
# }

# output "full_project_pool_path" {
#   value = "${data.terraform_remote_state.pools.outputs.full_project_pool_path}"
# }

# output "project_images_pool" {
#   value = "${data.terraform_remote_state.pools.outputs.project_images_pool}"
# }

# output "project_stage_pool" {
#   value = "${data.terraform_remote_state.pools.outputs.project_stage_pool}"
# }

# }




# output "project_parent_images" {
#   value = { for i in module.project_images : i => module.project_images.project_parent_images }
# }

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







# output "debian-12-image" {
#   value = "${module.project_images.project_parent_images["debian-12-genericcloud-amd64.qcow2"]}"
# }

# output "project_parent_images" {
#   value = "${module.project_images}"
# }
