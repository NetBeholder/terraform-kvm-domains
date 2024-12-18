variable "pools" {
  type = list(object({
    name = string
#    path = string
  }))
}

variable "base_project_pool_path" {
  type = string
}

locals {
  libvirt_uri  = "${data.terraform_remote_state.global_vars.outputs.libvirt_uri["my_host"]}"
  project_name = "${data.terraform_remote_state.global_vars.outputs.project_name}"
  project_pools = [
    for pool in var.pools :
      { 
        name = "${pool.name}" == "${local.project_name}" ? "${local.project_name}" : "${local.project_name}-${pool.name}"
        path = "${pool.name}" == "${local.project_name}" ? join("", ["${var.base_project_pool_path}/", "${pool.name}"]) : join("", ["${var.base_project_pool_path}/", "${local.project_name}/", "${pool.name}"])
      }
  ]
}
 
