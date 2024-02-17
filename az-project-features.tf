/*
Manages features for Azure DevOps projects
*/
resource "azuredevops_project_features" "this" {
  for_each   = var.create_project ? var.project_features : {}
  project_id = var.create_project ? one(azuredevops_project.this).id : one(data.azuredevops_project.this).id
  features = {
    "testplans"    = each.value.testplans != null ? each.value.testplans : "enabled"
    "artifacts"    = each.value.artifacts != null ? each.value.artifacts : "enabled"
    "boards"       = each.value.boards != null ? each.value.boards : "enabled"
    "repositories" = each.value.repositories != null ? each.value.repositories : "enabled"
  }
}