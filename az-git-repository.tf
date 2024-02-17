/*
Datasource
*/
# Load a specific Git repository by name
data "azuredevops_git_repository" "this" {
  for_each   = var.create_git_repository ? {} : var.repositories
  project_id = var.create_project ? one(azuredevops_project.this).id : one(data.azuredevops_project.this).id
  name       = each.key
}

resource "azuredevops_git_repository" "this" {
  for_each = var.create_git_repository ? var.repositories : {}

  project_id = var.create_project ? one(azuredevops_project.this).id : one(data.azuredevops_project.this).id
  name       = each.key

  default_branch = each.value.init_type == "Uninitialized" ? null : "refs/heads/main"

  initialization {
    init_type   = each.value.init_type
    source_type = each.value.init_type == "Import" ? each.value.source_type : null
    source_url  = each.value.init_type == "Import" ? each.value.source_url : null
    //service_connection_id = each.value.init_type == "Import" ? each.value.service_connection_id : null
  }
}

output "git_repositories" {
  description = "Map of created git repositories"
  value       = { for repo in azuredevops_git_repository.this : repo.name => repo }
}
