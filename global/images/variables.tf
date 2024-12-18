variable "images" {
  type = list(object({
    name    = string
    url     = string
  }))
}

locals {
  project_name = "${data.terraform_remote_state.global_vars.outputs.project_name}"
  libvirt_uri  = "${data.terraform_remote_state.global_vars.outputs.libvirt_uri["my_host"]}"
}