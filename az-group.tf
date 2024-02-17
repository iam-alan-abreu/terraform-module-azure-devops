# data "azuredevops_group" "readers" {
#   project_id = var.create_project ? one(azuredevops_project.this).id : one(data.azuredevops_project.this).id
#   name       = "Readers"
# }

# data "azuredevops_group" "contributors" {
#   project_id = var.create_project ? one(azuredevops_project.this).id : one(data.azuredevops_project.this).id
#   name       = "Contributors"
# }

resource "azuredevops_group" "developers" {
  count        = var.create_dev_group ? 1 : 0
  scope        = var.create_project ? one(azuredevops_project.this).id : one(data.azuredevops_project.this).id
  display_name = "Developers"
  description  = "Grupo dos Desenvolvedores"

  # members = [
  #   data.azuredevops_group.readers.descriptor,
  #   data.azuredevops_group.contributors.descriptor
  # ]
}

resource "azuredevops_group" "techlead_permissions" {
  count        = var.create_tl_group ? 1 : 0
  scope        = var.create_project ? one(azuredevops_project.this).id : one(data.azuredevops_project.this).id
  display_name = "Tech Leads"
  description  = "Grupo dos Tech Leads"

  # members = [
  #   data.azuredevops_group.readers.descriptor,
  #   data.azuredevops_group.contributors.descriptor
  # ]
}

resource "azuredevops_group" "product_owners" {
  count        = var.create_po_group ? 1 : 0
  scope        = var.create_project ? one(azuredevops_project.this).id : one(data.azuredevops_project.this).id
  display_name = "Product Owners"
  description  = "Grupo dos PO's"
}

resource "azuredevops_group" "custom_group" {
  for_each     = var.custom_group
  scope        = var.create_project ? one(azuredevops_project.this).id : one(data.azuredevops_project.this).id
  display_name = each.value.display_name
  description  = each.value.description != null ? each.value.description : "Grupo dos ${each.value.display_name}"
}