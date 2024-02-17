/*
Manage a file path pattern repository policy within Azure DevOps project.
*/
resource "azuredevops_repository_policy_file_path_pattern" "this" {
  for_each   = { for repos, values in var.repositories : repos => values if values.policy_file_path_pattern != null }
  project_id = var.create_project ? one(azuredevops_project.this).id : one(data.azuredevops_project.this).id

  enabled           = each.value.policy_file_path_pattern != null ? true : false
  blocking          = true
  filepath_patterns = each.value.policy_file_path_pattern
  repository_ids    = [var.create_git_repository ? azuredevops_git_repository.this[each.key].id : data.azuredevops_git_repository.this[each.key].id]
}

/*
Manage author email pattern repository policy within Azure DevOps project.
*/
resource "azuredevops_repository_policy_author_email_pattern" "this" {
  for_each              = { for repos, values in var.repositories : repos => values if values.policy_author_email_pattern != null }
  project_id            = var.create_project ? one(azuredevops_project.this).id : one(data.azuredevops_project.this).id
  enabled               = each.value.policy_author_email_pattern != null ? true : false
  blocking              = true
  author_email_patterns = each.value.policy_author_email_pattern
  repository_ids        = [var.create_git_repository ? azuredevops_git_repository.this[each.key].id : data.azuredevops_git_repository.this[each.key].id]
}

/*
Manage a max file size repository policy within Azure DevOps project.
*/
resource "azuredevops_repository_policy_max_file_size" "this" {
  for_each       = { for repos, values in var.repositories : repos => values if values.policy_max_file_size != null }
  project_id     = var.create_project ? one(azuredevops_project.this).id : one(data.azuredevops_project.this).id
  enabled        = each.value.policy_max_file_size != null ? true : false
  blocking       = true
  max_file_size  = each.value.policy_max_file_size
  repository_ids = [var.create_git_repository ? azuredevops_git_repository.this[each.key].id : data.azuredevops_git_repository.this[each.key].id]
}

/*
Manage a max path length repository policy within Azure DevOps project.
*/
resource "azuredevops_repository_policy_max_path_length" "this" {
  for_each        = { for repos, values in var.repositories : repos => values if values.policy_max_path_length != null }
  project_id      = var.create_project ? one(azuredevops_project.this).id : one(data.azuredevops_project.this).id
  enabled         = each.value.policy_max_path_length != null ? true : false
  blocking        = true
  max_path_length = each.value.policy_max_path_length
  repository_ids  = [var.create_git_repository ? azuredevops_git_repository.this[each.key].id : data.azuredevops_git_repository.this[each.key].id]
}

/*
Manage a reserved names repository policy within Azure DevOps project
*/
resource "azuredevops_repository_policy_reserved_names" "this" {
  for_each       = { for repos, values in var.repositories : repos => values if(values.create_policy_reserved_names != null && values.create_policy_reserved_names == true) }
  project_id     = var.create_project ? one(azuredevops_project.this).id : one(data.azuredevops_project.this).id
  enabled        = each.value.create_policy_reserved_names != null ? true : false
  blocking       = true
  repository_ids = [var.create_git_repository ? azuredevops_git_repository.this[each.key].id : data.azuredevops_git_repository.this[each.key].id]
}