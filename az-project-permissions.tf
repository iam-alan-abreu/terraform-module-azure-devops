resource "azuredevops_project_permissions" "developers_permission" {
  count      = var.create_dev_group ? 1 : 0
  project_id = var.create_project ? one(azuredevops_project.this).id : one(data.azuredevops_project.this).id
  principal  = one(azuredevops_group.developers).id
  permissions = {
    GENERIC_READ         = "Allow"
    WORK_ITEM_MOVE       = "Allow"
    "WORK_ITEM_DELETE"   = "Allow"
    VIEW_TEST_RESULTS    = "Allow"
    PUBLISH_TEST_RESULTS = "Allow"
    UPDATE_BUILD         = "Deny"
    DELETE_TEST_RESULTS  = "Deny"
    ADMINISTER_BUILD     = "Deny"
    DELETE               = "Deny"
    RENAME               = "Deny"
  }
}



resource "azuredevops_project_permissions" "custom_group" {
  for_each = var.custom_group
  #count      = var.create_dev_group ? 1 : 0
  project_id  = var.create_project ? one(azuredevops_project.this).id : one(data.azuredevops_project.this).id
  principal   = azuredevops_group.custom_group[each.key].id
  permissions = each.value.permissions == null ? var.custom_group_default_permissions : each.value.permissions
}
