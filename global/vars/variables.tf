variable "project_name" {
  type = string
  description = "Globally used as the project root path for all modules"
}

# https://libvirt.org/uri.html
variable "libvirt_uri" {
  type = map(string)
  default = {
    "some_kvm_host_uri" = "qemu+ssh://user@kvm_host/system"
  } 
}