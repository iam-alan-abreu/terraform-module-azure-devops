resource "azuredevops_environment" "this" {
  for_each   = var.create_environment ? var.environment : {}
  project_id = var.create_project ? one(azuredevops_project.this).id : one(data.azuredevops_project.this).id
  name       = each.key
}