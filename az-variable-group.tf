resource "azuredevops_variable_group" "this" {
  for_each     = var.create_project ? var.variable_group : {}
  project_id   = var.create_project ? one(azuredevops_project.this).id : one(data.azuredevops_project.this).id
  name         = each.key
  description  = "Varible group to ${each.key}"
  allow_access = each.value.allow_access

  dynamic "variable" {
    for_each = each.value.variables

    content {
      name         = variable.value.name
      secret_value = variable.value.is_secret ? variable.value.secret_value : null
      is_secret    = variable.value.is_secret
      value        = variable.value.value
    }

  }
}


output "variable_groups" {
  description = "Map of created variables groups"
  value       = { for variables in azuredevops_variable_group.this : variables.name => variables }
  sensitive   = true
}