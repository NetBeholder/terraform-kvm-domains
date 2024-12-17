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
output "project_base_images" {
  value = "${module.project_images.project_base_images}"
}

output "debian-12-image" {
  value = "${module.project_images.project_base_images["debian-12-genericcloud-amd64.qcow2"]}"
}

output "debian-12-generic-image" {
  value = "${module.project_images.project_base_images["debian-12-generic-amd64.qcow2"]}"
}
