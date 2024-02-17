resource "azuredevops_branch_policy_work_item_linking" "this" {
  for_each = (var.create_develop_branch && var.create_git_repository && var.create_branch_policy_work_item_linking) ? { for k, v in var.repositories : k => v if v.init_type == "Clean" } : {}

  project_id = var.create_project ? one(azuredevops_project.this).id : one(data.azuredevops_project.this).id

  enabled  = true
  blocking = true

  settings {

    dynamic "scope" {
      for_each = var.scope_configs

      content {
        repository_id  = var.create_git_repository ? azuredevops_git_repository.this[each.key].id : data.azuredevops_git_repository.this[each.key].id
        repository_ref = scope.value.ref != null ? (scope.value.ref == "default_branch" ? azuredevops_git_repository.this[each.key].default_branch : scope.value.ref) : null
        match_type     = scope.value.match_type
      }
    }
  }
}

resource "azuredevops_branch_policy_merge_types" "this" {
  for_each = (var.create_develop_branch && var.create_git_repository && var.create_branch_policy_merge_types) ? { for k, v in var.repositories : k => v if v.init_type == "Clean" } : {}

  project_id = var.create_project ? one(azuredevops_project.this).id : one(data.azuredevops_project.this).id

  enabled  = true
  blocking = true

  settings {
    allow_squash                  = each.value.merge_types_allow_squash
    allow_rebase_and_fast_forward = each.value.merge_types_allow_rebase_and_fast_forward
    allow_basic_no_fast_forward   = each.value.merge_types_allow_basic_no_fast_forward
    allow_rebase_with_merge       = each.value.merge_types_allow_rebase_with_merge

    scope {
      repository_id  = var.create_git_repository ? azuredevops_git_repository.this[each.key].id : data.azuredevops_git_repository.this[each.key].id
      repository_ref = var.create_git_repository ? azuredevops_git_repository.this[each.key].default_branch : data.azuredevops_git_repository.this[each.key].default_branch
      match_type     = "Exact"
    }

    scope {
      repository_id  = var.create_git_repository ? azuredevops_git_repository.this[each.key].id : data.azuredevops_git_repository.this[each.key].id
      repository_ref = "refs/heads/develop"
      match_type     = "Prefix"
    }

    scope {
      match_type = "DefaultBranch"
    }
  }
}