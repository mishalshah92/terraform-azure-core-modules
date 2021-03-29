variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "function_version" {
  type    = string
  default = "~1"
}

variable "app_service_plan_id" {
  type = string
}

variable "enabled" {
  type    = bool
  default = true
}

variable "enable_builtin_logging" {
  type    = bool
  default = true
}

variable "https_only" {
  type    = bool
  default = true
}

variable "os_type" {
  type    = string
  default = null
}

variable "app_settings" {
  type    = map(any)
  default = null
}

variable "client_affinity_enabled" {
  type    = bool
  default = false
}

variable "daily_memory_time_quota" {
  type    = number
  default = 0
}

variable "connection_string" {
  type    = map(any)
  default = null
}

# Auth settings

variable "auth_settings_enabled" {
  type    = bool
  default = false
}

variable "default_provider" {
  type    = string
  default = null
}

variable "additional_login_params" {
  type    = map(any)
  default = null
}

variable "allowed_external_redirect_urls" {
  type    = list(any)
  default = null
}

variable "active_directory_settings" {
  type    = list(any)
  default = []
}

variable "facebook_auth_settings" {
  type    = list(any)
  default = []
}

variable "google_auth_settings" {
  type    = list(any)
  default = []
}

variable "microsoft_auth_settings" {
  type    = list(any)
  default = []
}

variable "twitter_auth_settings" {
  type    = list(any)
  default = []
}

variable "runtime_version" {
  type    = string
  default = null
}

variable "issuer" {
  type    = string
  default = null
}

variable "token_store_enabled" {
  type    = bool
  default = false
}

variable "token_refresh_extension_hours" {
  type    = number
  default = 24
}

variable "unauthenticated_client_action" {
  type    = string
  default = null
}

# Identity

variable "identity_type" {
  type    = string
  default = "SystemAssigned"
}

variable "identity_ids" {
  type    = list(any)
  default = null
}

# Site Config

variable "always_on" {
  type    = bool
  default = false
}

variable "cors_allowed_origins" {
  type    = list(any)
  default = ["*"]
}

variable "cors_support_credentials" {
  type    = bool
  default = null
}

variable "ftps_state" {
  type    = string
  default = "AllAllowed"
}

variable "health_check_path" {
  type    = string
  default = null
}

variable "http2_enabled" {
  type    = bool
  default = false
}

variable "min_tls_version" {
  type    = string
  default = "1.2"
}

variable "websockets_enabled" {
  type    = string
  default = false
}

variable "pre_warmed_instance_count" {
  type    = number
  default = 0
}

variable "linux_fx_version" {
  type    = string
  default = null
}

variable "use_32_bit_worker_process" {
  type    = bool
  default = true
}

variable "ip_restriction" {
  type    = list(any)
  default = null
}

variable "scm_ip_restriction" {
  type    = list(any)
  default = null
}

variable "scm_use_main_ip_restriction" {
  type    = bool
  default = false
}

variable "scm_type" {
  type    = string
  default = "None"
}

# Source Control

variable "repo_url" {
  type    = string
  default = null
}

variable "repo_branch" {
  type    = string
  default = null
}

variable "manual_integration" {
  type    = bool
  default = false
}

variable "rollback_enabled" {
  type    = bool
  default = false
}

variable "use_mercurial" {
  type    = bool
  default = false
}

# Storage Account

variable "storage_account_name" {
  type = string
}

variable "storage_account_access_key" {
  type = string
}


# tags
variable "customer" {
  type = string
}

variable "env" {
  type = string
}

variable "owner" {
  type = string
}

variable "email" {
  type = string
}

variable "repo" {
  type = string
}

variable "deployment" {
  type = string
}

variable "module" {
  type = string
}

variable "resource_group" {
  type = string
}

variable "tool" {
  description = "Automation tool info"
  default     = "Managed by Terraform"
}

variable "tags" {
  type    = map(string)
  default = {}
}