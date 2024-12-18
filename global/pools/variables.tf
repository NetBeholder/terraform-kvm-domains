variable "pools" {
  type = list(object({
    name = string
#    path = string
  }))
}

variable "project" {
  type = string
}

variable "base_project_pool_path" {
  type = string
}

locals {
  project_pools = [
    for pool in var.pools :
      { 
        name = "${pool.name}" == "${var.project}" ? "${var.project}" : "${var.project}-${pool.name}"
        path = "${pool.name}" == "${var.project}" ? join("", ["${var.base_project_pool_path}/", "${pool.name}"]) : join("", ["${var.base_project_pool_path}/", "${var.project}/", "${pool.name}"])
        #path = join("", ["${var.base_project_pool_path}/", "${var.project}/", "${pool.name}"]) #, "${pool.name}")
      }
  ]
}
 
