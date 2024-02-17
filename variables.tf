/*
PROJECT
*/
variable "create_project" {
  type        = bool
  default     = true
  description = "Opcional: Define se o projeto será criado."
}

variable "project_name" {
  type        = string
  description = "Obrigatório: Nome do projeto a ser criado."
}

/*
PROJECT FEATURES
*/
variable "project_features" {
  type = map(object({
    testplans    = optional(string, null)
    artifacts    = optional(string, null)
    boards       = optional(string, null)
    repositories = optional(string, null)
  }))
  default     = {}
  description = "Opcional: Características do projeto, como testplans, artifacts, boards e repositories."
}

/*
REPOSITORY
*/
variable "create_git_repository" {
  type        = bool
  default     = true
  description = "Opcional: Define se o repositório Git será criado."
}

variable "repositories" {
  type = map(object({
    init_type                                 = string
    source_type                               = optional(string)
    source_url                                = optional(string)
    service_connection_id                     = optional(string)
    policy_file_path_pattern                  = optional(list(any))
    policy_author_email_pattern               = optional(list(any))
    policy_max_file_size                      = optional(number)
    policy_max_path_length                    = optional(number)
    create_policy_reserved_names              = optional(bool)
    merge_types_allow_squash                  = optional(bool, true)
    merge_types_allow_rebase_and_fast_forward = optional(bool, true)
    merge_types_allow_basic_no_fast_forward   = optional(bool, true)
    merge_types_allow_rebase_with_merge       = optional(bool, true)
  }))
  default     = {}
  description = "Opcional: Configurações dos repositórios Git, incluindo tipo de inicialização e detalhes de origem."
}

/*
ENVIRONMENT
*/
variable "create_environment" {
  type        = bool
  default     = false
  description = "Opcional: Define se o ambiente será criado."
}

variable "environment" {
  type = map(object({
    allowed_branches            = optional(string, null)
    create_check_branch_control = optional(bool, false)
    verify_branch_protection    = optional(bool, true)
    target_resource_type        = optional(string, "environment")
  }))
  default = {
    "dev" = {
      allowed_branches = "refs/heads/develop, refs/heads/feature/*"
    },
    "hmg" = {
      allowed_branches = "refs/heads/prerelease/*, refs/heads/release/*"
    },
    "prd" = {
      allowed_branches = "refs/heads/main"
    }
  }

  description = "Opcional: Configurações dos ambientes, como desenvolvimento, homologação e produção."
}

/*
GROUPs
*/
variable "create_dev_group" {
  type        = bool
  default     = true
  description = "Opcional: Define se o grupo dos desenvolvedores será criado."
}

variable "create_tl_group" {
  type        = bool
  default     = true
  description = "Opcional: Define se o grupo de Tech Leads será criado."
}

variable "create_po_group" {
  type        = bool
  default     = true
  description = "Opcional: Define se o grupo de Product Owners será criado."
}

variable "custom_group" {
  type = map(object({
    display_name = string
    description  = optional(string)
    permissions  = optional(map(string))
  }))
  default = {}
}

variable "custom_group_default_permissions" {
  type = map(string)
  default = {
    GENERIC_READ         = "Allow"
    WORK_ITEM_MOVE       = "Allow"
    WORK_ITEM_DELETE     = "Allow"
    VIEW_TEST_RESULTS    = "Allow"
    PUBLISH_TEST_RESULTS = "Allow"
    UPDATE_BUILD         = "Deny"
    DELETE_TEST_RESULTS  = "Deny"
    ADMINISTER_BUILD     = "Deny"
    DELETE               = "Deny"
    RENAME               = "Deny"
  }
}

/*
GROUP PERMISSIONS
*/
variable "dev_permissions" {
  type = map(any)
  default = {
    GenericRead           = "Allow" // Permite ler
    GenericContribute     = "Allow" // Permite contribuir
    CreateBranch          = "Allow" // Permite criar branch
    CreateTag             = "Allow" // Permite criar tag
    ManageNote            = "Allow" // Permite gerenciar notas
    PullRequestContribute = "Allow" // Permite contribuir em pull requests
    // As seguintes permissões são geralmente restritas para evitar alterações históricas ou administração
    ForcePush               = "Deny" // Negar força de push
    CreateRepository        = "Deny" // Negar criação de repositório
    DeleteRepository        = "Deny" // Negar deleção de repositório
    RenameRepository        = "Deny" // Negar renomeação de repositório
    EditPolicies            = "Deny" // Negar edição de políticas
    RemoveOthersLocks       = "Deny" // Negar remoção de bloqueios de outros
    ManagePermissions       = "Deny" // Negar gerenciamento de permissões
    PullRequestBypassPolicy = "Deny" // Negar bypass de políticas em pull requests
    Administer              = "Deny" // Negar administração
    PolicyExempt            = "Deny" // Negar isenção de políticas
  }
}

variable "techlead_permissions" {
  type = map(any)
  default = {
    GenericRead             = "Allow"
    GenericContribute       = "Allow"
    CreateBranch            = "Allow"
    CreateTag               = "Allow"
    ManageNote              = "Allow"
    PullRequestContribute   = "Allow"
    ForcePush               = "Allow"
    CreateRepository        = "Allow"
    DeleteRepository        = "Allow"
    RenameRepository        = "Allow"
    EditPolicies            = "Allow"
    RemoveOthersLocks       = "Allow"
    ManagePermissions       = "Allow"
    PullRequestBypassPolicy = "Allow"
    Administer              = "Deny"
    PolicyExempt            = "Deny"
  }
}

variable "po_permissions" {
  type = map(any)
  default = {
    GenericRead             = "Allow"
    GenericContribute       = "Allow"
    CreateBranch            = "Deny"
    CreateTag               = "Deny"
    ManageNote              = "Allow"
    PullRequestContribute   = "Allow"
    ForcePush               = "Deny"
    CreateRepository        = "Deny"
    DeleteRepository        = "Deny"
    RenameRepository        = "Deny"
    EditPolicies            = "Deny"
    RemoveOthersLocks       = "Deny"
    ManagePermissions       = "Deny"
    PullRequestBypassPolicy = "Deny"
    Administer              = "Deny"
    PolicyExempt            = "Deny"
  }
}

variable "git_external_group_permissions" {
  type = map(any)
  default = {
    GenericRead           = "Allow" // Permite ler
    GenericContribute     = "Allow" // Permite contribuir
    CreateBranch          = "Allow" // Permite criar branch
    CreateTag             = "Allow" // Permite criar tag
    ManageNote            = "Allow" // Permite gerenciar notas
    PullRequestContribute = "Allow" // Permite contribuir em pull requests
    // As seguintes permissões são geralmente restritas para evitar alterações históricas ou administração
    ForcePush               = "Deny" // Negar força de push
    CreateRepository        = "Deny" // Negar criação de repositório
    DeleteRepository        = "Deny" // Negar deleção de repositório
    RenameRepository        = "Deny" // Negar renomeação de repositório
    EditPolicies            = "Deny" // Negar edição de políticas
    RemoveOthersLocks       = "Deny" // Negar remoção de bloqueios de outros
    ManagePermissions       = "Deny" // Negar gerenciamento de permissões
    PullRequestBypassPolicy = "Deny" // Negar bypass de políticas em pull requests
    Administer              = "Deny" // Negar administração
    PolicyExempt            = "Deny" // Negar isenção de políticas
  }
}


/*
BRANCH
*/
variable "create_develop_branch" {
  type        = bool
  default     = true
  description = "Opcional: Define se a branch 'develop' será criada."
}

variable "create_branch_policy_work_item_linking" {
  type        = bool
  default     = true
  description = "Opcional: Define se a branch 'develop' será criada."
}

variable "create_branch_policy_merge_types" {
  type        = bool
  default     = true
  description = "Opcional: Define se a branch 'develop' será criada."
}


# BRANCH POLICY
variable "scope_configs" {
  description = "List of scope configurations for branch policy"
  type = list(object({
    ref        = optional(string)
    match_type = string
  }))
  default = [
    { ref = "default_branch", match_type = "Exact" },
    { ref = "refs/heads/develop", match_type = "Exact" },
    { ref = "refs/heads/feature/", match_type = "Prefix" },
    { ref = "refs/heads/release/", match_type = "Prefix" }

  ]
}

# VARIABLE GROUPS
variable "variable_group" {
  description = "Map of variable groups with their respective variables and settings"
  type = map(object({
    allow_access = optional(bool, true)
    variables = map(object({
      name         = string
      is_secret    = optional(bool, false)
      secret_value = optional(string)
      value        = optional(string)
    }))
  }))
  default = {}
}


