resource "azuredevops_check_branch_control" "this" {
  for_each = var.create_environment ? { for k, v in var.environment : k => v if v.create_check_branch_control } : {}

  project_id               = var.create_project ? one(azuredevops_project.this).id : one(data.azuredevops_project.this).id
  display_name             = "Managed by Terraform Pipelines"
  target_resource_id       = azuredevops_environment.this[each.key].id
  target_resource_type     = var.environment[each.key].target_resource_type
  allowed_branches         = var.environment[each.key].create_check_branch_control ? var.environment[each.key].allowed_branches : null
  verify_branch_protection = var.environment[each.key].verify_branch_protection

  lifecycle {
    precondition {
      condition     = var.environment[each.key].allowed_branches != null
      error_message = "To create a branch control check on an environment, the allowed_branches must be set."
    }
  }
}

/*
OUTPUTS
*/
output "branch_control_develop" {
  description = "Output dos repositorios criados"
  value = {
    for k, this in azuredevops_check_branch_control.this : k => this
  }
}

