# }
output "full_project_pool_path" {
  value = "${local.full_project_pool_path}"
}

output "project_images_pool" {
  value = "${libvirt_pool.project_images_pool}"
}
output "project_stage_pool" {
  value = "${libvirt_pool.project_stage_pool}"
}