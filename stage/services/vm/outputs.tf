# output "project_domains" {
#   value = "${module.project_vm}"
# }

# output "test" {
#   value = "${module.project_vm}"
# }

output "project_domains" {
  value = [for i in module.project_vm : i.project_domains]
}