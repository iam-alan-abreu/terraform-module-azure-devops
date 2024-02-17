/*
Datasource
*/
# Load a specific Project by name
data "azuredevops_project" "this" {
  count = var.create_project ? 0 : 1
  name  = var.project_name
}

resource "azuredevops_project" "this" {
  count              = var.create_project ? 1 : 0
  name               = var.project_name
  visibility         = "private"
  version_control    = "Git"
  work_item_template = "Agile"
}


/*
Outputs
*/
output "project_id" {
  value       = one(azuredevops_project.this)
  description = "The Azure DevOps project outputs."
}

