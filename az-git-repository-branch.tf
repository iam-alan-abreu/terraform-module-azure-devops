/*
Manages a Git Repository Branch.
*/
resource "azuredevops_git_repository_branch" "develop" {
  for_each = (var.create_develop_branch && var.create_git_repository) ? { for k, v in var.repositories : k => v if v.init_type == "Clean" } : {}

  repository_id = var.create_git_repository ? azuredevops_git_repository.this[each.key].id : data.azuredevops_git_repository.this[each.key].id
  name          = "develop"
  ref_branch    = "refs/heads/main"
}
