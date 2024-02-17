resource "azuredevops_git_permissions" "dev_permissions" {
  count      = var.create_dev_group ? 1 : 0
  project_id = var.create_project ? one(azuredevops_project.this).id : one(data.azuredevops_project.this).id
  principal  = one(azuredevops_group.developers).id // ID do grupo de desenvolvedores

  permissions = var.dev_permissions
}

resource "azuredevops_git_permissions" "techlead_permissions" {
  count      = var.create_tl_group ? 1 : 0
  project_id = var.create_project ? one(azuredevops_project.this).id : one(data.azuredevops_project.this).id
  principal  = one(azuredevops_group.techlead_permissions).id

  permissions = var.techlead_permissions
}

resource "azuredevops_git_permissions" "po_permissions" {
  count      = var.create_po_group ? 1 : 0
  project_id = var.create_project ? one(azuredevops_project.this).id : one(data.azuredevops_project.this).id
  principal  = one(azuredevops_group.product_owners).id

  permissions = var.po_permissions
}

resource "azuredevops_git_permissions" "external_permissions" {
  for_each   = var.custom_group
  project_id = var.create_project ? one(azuredevops_project.this).id : one(data.azuredevops_project.this).id
  principal  = azuredevops_group.custom_group[each.key].id

  permissions = var.git_external_group_permissions
}

/*
OUTPUTS
*/
output "dev_permissions_id" {
  description = "ID do recurso de permissões para o grupo de desenvolvedores"
  value       = one(azuredevops_git_permissions.dev_permissions[*]).id
}

output "techlead_permissions_id" {
  description = "ID do recurso de permissões para o grupo de Tech Leads"
  value       = one(azuredevops_git_permissions.techlead_permissions[*]).id
}

output "po_permissions_id" {
  description = "ID do recurso de permissões para o grupo de Product Owners"
  value       = one(azuredevops_git_permissions.po_permissions[*]).id
}

output "external_permissions_id" {
  description = "IDs dos recursos de permissões para grupos personalizados"
  value = {
    for k, permission in azuredevops_git_permissions.external_permissions : k => permission.id
  }
}




