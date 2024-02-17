module "az_devops_complete" {
  source = "../../"

  create_project = true
  project_name   = "Project-Name"

  project_features = {
    "Project-Name" = {
      testplans    = "disabled"
      artifacts    = "enabled"
      boards       = "enabled"
      repositories = "enabled"
    }
  }

  repositories = {
    repo-import = {
      init_type   = "Import"
      source_type = "Git"
      source_url  = "https://github.com/microsoft/terraform-provider-azuredevops.git"
    },
    repo-clean-type = {
      init_type                    = "Clean"
      policy_file_path_pattern     = ["*/bin; */obj; */node_modules; */.log; */.env"]
      policy_author_email_pattern  = ["*@teste.com.br"]
      policy_max_file_size         = 5
      policy_max_path_length       = 248
      create_policy_reserved_names = true
    },
    repo-uninitialized-type = {
      init_type = "Uninitialized"
    }
  }

  create_environment = true // Define se o ambiente será criado
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
  } // Configurações dos ambientes como dev, qa e prd

  //VARIABLE GROUPS
  variable_group = {
    "vg1" = {
      allow_access = true
      variables = {
        "var1" = {
          name      = "Variable1"
          is_secret = false
          value     = "Value1"
        },
        "var2" = {
          name         = "Variable2"
          is_secret    = true
          secret_value = "SecretValue1"
        }
      }
    }
  }

  // Variáveis dos GRUPOS
  create_dev_group = true // Define se o grupo de desenvolvedores será criado
  create_tl_group  = true // Define se o grupo de Tech Leads será criado
  create_po_group  = true // Define se o grupo de Product Owners será criado

  custom_group = {
    "ConsultoriaC" = {
      display_name = "Group A"
    },
    "ConsultoriaD" = {
      display_name = "Group B"
    }
  }

  // Variáveis da BRANCH
  create_develop_branch                  = true // Define se a branch 'develop' será criada
  create_branch_policy_work_item_linking = true // Define política de linking de work item para a branch 'develop'
  create_branch_policy_merge_types       = true // Define política de tipos de merge para a branch 'develop'

}

output "az_devops_simple" {
  value     = module.az_devops_complete
  sensitive = true
}