# output "full_project_pool_path" {
#   value = "${module.project_pools.full_project_pool_path}"
# }

# output "project_images_pool" {
#   value = "${module.project_pools.project_images_pool}"
# }

# output "project_stage_pool" {
#   value = "${module.project_pools.project_stage_pool}"
# }

# output "local_project_pools" {
#   value = [ for i in local.project_pools : i ]  
# }


# # list
# output "project_pools" {
#     value = [ for i in module.project_pools : i.project_pools ]  
# }


# #### list
# output "project_images_pool" {
#   value = module.project_pools["${var.project}-images"].project_pools
# }
# ###

### map
output "project_pools" {
  value =  {
    for k, pool in module.project_pools : k => pool.project_pools
  }
}
###
