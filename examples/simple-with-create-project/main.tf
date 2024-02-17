module "az_devops_simple" {
  source = "../../" 

  create_project = true           
  project_name   = "Project-Name"

  repositories = {
    repo_uninitialized_type = {
      init_type = "Uninitialized"
    }
  } 

  create_environment = true
  environment = {
    "dev" = {
      allowed_branches            = "refs/heads/develop, refs/heads/feature/*"
      create_check_branch_control = false
    },
    "qa" = {
      allowed_branches            = "refs/heads/prerelease/*, refs/heads/release/*"
      create_check_branch_control = true
    },
    "prd" = {
      allowed_branches            = "refs/heads/main"
      create_check_branch_control = true
    }
  }
}

output "az_devops_simple" {
  value     = module.az_devops_simple
  sensitive = true
}