# list
output "project_domains_list" {
  value = [for i in module.project_domains : i.project_domains]
}

### map
output "project_domains_map" {
  value =  {
    for k, domain in module.project_domains : k => domain.project_domains
  }
}