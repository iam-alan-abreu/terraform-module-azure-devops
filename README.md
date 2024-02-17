## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azuredevops"></a> [azuredevops](#requirement\_azuredevops) | 0.10.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuredevops"></a> [azuredevops](#provider\_azuredevops) | 0.10.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azuredevops_branch_policy_merge_types.this](https://registry.terraform.io/providers/microsoft/azuredevops/0.10.0/docs/resources/branch_policy_merge_types) | resource |
| [azuredevops_branch_policy_work_item_linking.this](https://registry.terraform.io/providers/microsoft/azuredevops/0.10.0/docs/resources/branch_policy_work_item_linking) | resource |
| [azuredevops_check_branch_control.this](https://registry.terraform.io/providers/microsoft/azuredevops/0.10.0/docs/resources/check_branch_control) | resource |
| [azuredevops_environment.this](https://registry.terraform.io/providers/microsoft/azuredevops/0.10.0/docs/resources/environment) | resource |
| [azuredevops_git_permissions.dev_permissions](https://registry.terraform.io/providers/microsoft/azuredevops/0.10.0/docs/resources/git_permissions) | resource |
| [azuredevops_git_permissions.external_permissions](https://registry.terraform.io/providers/microsoft/azuredevops/0.10.0/docs/resources/git_permissions) | resource |
| [azuredevops_git_permissions.po_permissions](https://registry.terraform.io/providers/microsoft/azuredevops/0.10.0/docs/resources/git_permissions) | resource |
| [azuredevops_git_permissions.techlead_permissions](https://registry.terraform.io/providers/microsoft/azuredevops/0.10.0/docs/resources/git_permissions) | resource |
| [azuredevops_git_repository.this](https://registry.terraform.io/providers/microsoft/azuredevops/0.10.0/docs/resources/git_repository) | resource |
| [azuredevops_git_repository_branch.develop](https://registry.terraform.io/providers/microsoft/azuredevops/0.10.0/docs/resources/git_repository_branch) | resource |
| [azuredevops_group.custom_group](https://registry.terraform.io/providers/microsoft/azuredevops/0.10.0/docs/resources/group) | resource |
| [azuredevops_group.developers](https://registry.terraform.io/providers/microsoft/azuredevops/0.10.0/docs/resources/group) | resource |
| [azuredevops_group.product_owners](https://registry.terraform.io/providers/microsoft/azuredevops/0.10.0/docs/resources/group) | resource |
| [azuredevops_group.techlead_permissions](https://registry.terraform.io/providers/microsoft/azuredevops/0.10.0/docs/resources/group) | resource |
| [azuredevops_project.this](https://registry.terraform.io/providers/microsoft/azuredevops/0.10.0/docs/resources/project) | resource |
| [azuredevops_project_features.this](https://registry.terraform.io/providers/microsoft/azuredevops/0.10.0/docs/resources/project_features) | resource |
| [azuredevops_project_permissions.custom_group](https://registry.terraform.io/providers/microsoft/azuredevops/0.10.0/docs/resources/project_permissions) | resource |
| [azuredevops_project_permissions.developers_permission](https://registry.terraform.io/providers/microsoft/azuredevops/0.10.0/docs/resources/project_permissions) | resource |
| [azuredevops_repository_policy_author_email_pattern.this](https://registry.terraform.io/providers/microsoft/azuredevops/0.10.0/docs/resources/repository_policy_author_email_pattern) | resource |
| [azuredevops_repository_policy_file_path_pattern.this](https://registry.terraform.io/providers/microsoft/azuredevops/0.10.0/docs/resources/repository_policy_file_path_pattern) | resource |
| [azuredevops_repository_policy_max_file_size.this](https://registry.terraform.io/providers/microsoft/azuredevops/0.10.0/docs/resources/repository_policy_max_file_size) | resource |
| [azuredevops_repository_policy_max_path_length.this](https://registry.terraform.io/providers/microsoft/azuredevops/0.10.0/docs/resources/repository_policy_max_path_length) | resource |
| [azuredevops_repository_policy_reserved_names.this](https://registry.terraform.io/providers/microsoft/azuredevops/0.10.0/docs/resources/repository_policy_reserved_names) | resource |
| [azuredevops_variable_group.this](https://registry.terraform.io/providers/microsoft/azuredevops/0.10.0/docs/resources/variable_group) | resource |
| [azuredevops_git_repository.this](https://registry.terraform.io/providers/microsoft/azuredevops/0.10.0/docs/data-sources/git_repository) | data source |
| [azuredevops_project.this](https://registry.terraform.io/providers/microsoft/azuredevops/0.10.0/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_branch_policy_merge_types"></a> [create\_branch\_policy\_merge\_types](#input\_create\_branch\_policy\_merge\_types) | Opcional: Define se a branch 'develop' será criada. | `bool` | `true` | no |
| <a name="input_create_branch_policy_work_item_linking"></a> [create\_branch\_policy\_work\_item\_linking](#input\_create\_branch\_policy\_work\_item\_linking) | Opcional: Define se a branch 'develop' será criada. | `bool` | `true` | no |
| <a name="input_create_dev_group"></a> [create\_dev\_group](#input\_create\_dev\_group) | Opcional: Define se o grupo dos desenvolvedores será criado. | `bool` | `true` | no |
| <a name="input_create_develop_branch"></a> [create\_develop\_branch](#input\_create\_develop\_branch) | Opcional: Define se a branch 'develop' será criada. | `bool` | `true` | no |
| <a name="input_create_environment"></a> [create\_environment](#input\_create\_environment) | Opcional: Define se o ambiente será criado. | `bool` | `false` | no |
| <a name="input_create_git_repository"></a> [create\_git\_repository](#input\_create\_git\_repository) | Opcional: Define se o repositório Git será criado. | `bool` | `true` | no |
| <a name="input_create_po_group"></a> [create\_po\_group](#input\_create\_po\_group) | Opcional: Define se o grupo de Product Owners será criado. | `bool` | `true` | no |
| <a name="input_create_project"></a> [create\_project](#input\_create\_project) | Opcional: Define se o projeto será criado. | `bool` | `true` | no |
| <a name="input_create_tl_group"></a> [create\_tl\_group](#input\_create\_tl\_group) | Opcional: Define se o grupo de Tech Leads será criado. | `bool` | `true` | no |
| <a name="input_custom_group"></a> [custom\_group](#input\_custom\_group) | n/a | <pre>map(object({<br>    display_name = string<br>    description  = optional(string)<br>    permissions  = optional(map(string))<br>  }))</pre> | `{}` | no |
| <a name="input_custom_group_default_permissions"></a> [custom\_group\_default\_permissions](#input\_custom\_group\_default\_permissions) | n/a | `map(string)` | <pre>{<br>  "ADMINISTER_BUILD": "Deny",<br>  "DELETE": "Deny",<br>  "DELETE_TEST_RESULTS": "Deny",<br>  "GENERIC_READ": "Allow",<br>  "PUBLISH_TEST_RESULTS": "Allow",<br>  "RENAME": "Deny",<br>  "UPDATE_BUILD": "Deny",<br>  "VIEW_TEST_RESULTS": "Allow",<br>  "WORK_ITEM_DELETE": "Allow",<br>  "WORK_ITEM_MOVE": "Allow"<br>}</pre> | no |
| <a name="input_dev_permissions"></a> [dev\_permissions](#input\_dev\_permissions) | n/a | `map(any)` | <pre>{<br>  "Administer": "Deny",<br>  "CreateBranch": "Allow",<br>  "CreateRepository": "Deny",<br>  "CreateTag": "Allow",<br>  "DeleteRepository": "Deny",<br>  "EditPolicies": "Deny",<br>  "ForcePush": "Deny",<br>  "GenericContribute": "Allow",<br>  "GenericRead": "Allow",<br>  "ManageNote": "Allow",<br>  "ManagePermissions": "Deny",<br>  "PolicyExempt": "Deny",<br>  "PullRequestBypassPolicy": "Deny",<br>  "PullRequestContribute": "Allow",<br>  "RemoveOthersLocks": "Deny",<br>  "RenameRepository": "Deny"<br>}</pre> | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Opcional: Configurações dos ambientes, como desenvolvimento, homologação e produção. | <pre>map(object({<br>    allowed_branches            = optional(string, null)<br>    create_check_branch_control = optional(bool, false)<br>    verify_branch_protection    = optional(bool, true)<br>    target_resource_type        = optional(string, "environment")<br>  }))</pre> | <pre>{<br>  "dev": {<br>    "allowed_branches": "refs/heads/develop, refs/heads/feature/*"<br>  },<br>  "hmg": {<br>    "allowed_branches": "refs/heads/prerelease/*, refs/heads/release/*"<br>  },<br>  "prd": {<br>    "allowed_branches": "refs/heads/main"<br>  }<br>}</pre> | no |
| <a name="input_git_external_group_permissions"></a> [git\_external\_group\_permissions](#input\_git\_external\_group\_permissions) | n/a | `map(any)` | <pre>{<br>  "Administer": "Deny",<br>  "CreateBranch": "Allow",<br>  "CreateRepository": "Deny",<br>  "CreateTag": "Allow",<br>  "DeleteRepository": "Deny",<br>  "EditPolicies": "Deny",<br>  "ForcePush": "Deny",<br>  "GenericContribute": "Allow",<br>  "GenericRead": "Allow",<br>  "ManageNote": "Allow",<br>  "ManagePermissions": "Deny",<br>  "PolicyExempt": "Deny",<br>  "PullRequestBypassPolicy": "Deny",<br>  "PullRequestContribute": "Allow",<br>  "RemoveOthersLocks": "Deny",<br>  "RenameRepository": "Deny"<br>}</pre> | no |
| <a name="input_po_permissions"></a> [po\_permissions](#input\_po\_permissions) | n/a | `map(any)` | <pre>{<br>  "Administer": "Deny",<br>  "CreateBranch": "Deny",<br>  "CreateRepository": "Deny",<br>  "CreateTag": "Deny",<br>  "DeleteRepository": "Deny",<br>  "EditPolicies": "Deny",<br>  "ForcePush": "Deny",<br>  "GenericContribute": "Allow",<br>  "GenericRead": "Allow",<br>  "ManageNote": "Allow",<br>  "ManagePermissions": "Deny",<br>  "PolicyExempt": "Deny",<br>  "PullRequestBypassPolicy": "Deny",<br>  "PullRequestContribute": "Allow",<br>  "RemoveOthersLocks": "Deny",<br>  "RenameRepository": "Deny"<br>}</pre> | no |
| <a name="input_project_features"></a> [project\_features](#input\_project\_features) | Opcional: Características do projeto, como testplans, artifacts, boards e repositories. | <pre>map(object({<br>    testplans    = optional(string, null)<br>    artifacts    = optional(string, null)<br>    boards       = optional(string, null)<br>    repositories = optional(string, null)<br>  }))</pre> | `{}` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Obrigatório: Nome do projeto a ser criado. | `string` | n/a | yes |
| <a name="input_repositories"></a> [repositories](#input\_repositories) | Opcional: Configurações dos repositórios Git, incluindo tipo de inicialização e detalhes de origem. | <pre>map(object({<br>    init_type                                 = string<br>    source_type                               = optional(string)<br>    source_url                                = optional(string)<br>    service_connection_id                     = optional(string)<br>    policy_file_path_pattern                  = optional(list(any))<br>    policy_author_email_pattern               = optional(list(any))<br>    policy_max_file_size                      = optional(number)<br>    policy_max_path_length                    = optional(number)<br>    create_policy_reserved_names              = optional(bool)<br>    merge_types_allow_squash                  = optional(bool, true)<br>    merge_types_allow_rebase_and_fast_forward = optional(bool, true)<br>    merge_types_allow_basic_no_fast_forward   = optional(bool, true)<br>    merge_types_allow_rebase_with_merge       = optional(bool, true)<br>  }))</pre> | `{}` | no |
| <a name="input_scope_configs"></a> [scope\_configs](#input\_scope\_configs) | List of scope configurations for branch policy | <pre>list(object({<br>    ref        = optional(string)<br>    match_type = string<br>  }))</pre> | <pre>[<br>  {<br>    "match_type": "Exact",<br>    "ref": "default_branch"<br>  },<br>  {<br>    "match_type": "Exact",<br>    "ref": "refs/heads/develop"<br>  },<br>  {<br>    "match_type": "Prefix",<br>    "ref": "refs/heads/feature/"<br>  },<br>  {<br>    "match_type": "Prefix",<br>    "ref": "refs/heads/release/"<br>  }<br>]</pre> | no |
| <a name="input_techlead_permissions"></a> [techlead\_permissions](#input\_techlead\_permissions) | n/a | `map(any)` | <pre>{<br>  "Administer": "Deny",<br>  "CreateBranch": "Allow",<br>  "CreateRepository": "Allow",<br>  "CreateTag": "Allow",<br>  "DeleteRepository": "Allow",<br>  "EditPolicies": "Allow",<br>  "ForcePush": "Allow",<br>  "GenericContribute": "Allow",<br>  "GenericRead": "Allow",<br>  "ManageNote": "Allow",<br>  "ManagePermissions": "Allow",<br>  "PolicyExempt": "Deny",<br>  "PullRequestBypassPolicy": "Allow",<br>  "PullRequestContribute": "Allow",<br>  "RemoveOthersLocks": "Allow",<br>  "RenameRepository": "Allow"<br>}</pre> | no |
| <a name="input_variable_group"></a> [variable\_group](#input\_variable\_group) | Map of variable groups with their respective variables and settings | <pre>map(object({<br>    allow_access = optional(bool, true)<br>    variables = map(object({<br>      name         = string<br>      is_secret    = optional(bool, false)<br>      secret_value = optional(string)<br>      value        = optional(string)<br>    }))<br>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_branch_control_develop"></a> [branch\_control\_develop](#output\_branch\_control\_develop) | Output dos repositorios criados |
| <a name="output_dev_permissions_id"></a> [dev\_permissions\_id](#output\_dev\_permissions\_id) | ID do recurso de permissões para o grupo de desenvolvedores |
| <a name="output_external_permissions_id"></a> [external\_permissions\_id](#output\_external\_permissions\_id) | IDs dos recursos de permissões para grupos personalizados |
| <a name="output_git_repositories"></a> [git\_repositories](#output\_git\_repositories) | Map of created git repositories |
| <a name="output_po_permissions_id"></a> [po\_permissions\_id](#output\_po\_permissions\_id) | ID do recurso de permissões para o grupo de Product Owners |
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | The Azure DevOps project outputs. |
| <a name="output_techlead_permissions_id"></a> [techlead\_permissions\_id](#output\_techlead\_permissions\_id) | ID do recurso de permissões para o grupo de Tech Leads |
| <a name="output_variable_groups"></a> [variable\_groups](#output\_variable\_groups) | Map of created variables groups |
