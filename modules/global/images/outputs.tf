#  base_volume_id = libvirt_volume.image.id
# output "volume_id" {
#   value = "${libvirt_volume.image.id}"
# }
# output "full_project_pool_path" {
#   value = "${local.full_project_pool_path}"
# }
output "project_parent_images" {
  value = "${libvirt_volume.image}"
}
