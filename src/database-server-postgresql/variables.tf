variable "name" {
  type = string
}

variable "location" {
  type = string
}

# Config

variable "create_mode" {
  type    = string
  default = "Default"
}

variable "sku_name" {
  type = string
}

variable "db_version" {
  type = string
}

variable "public_network_access_enabled" {
  type    = string
  default = false
}

# Auth

variable "administrator_username" {
  type    = string
  default = null
}

variable "administrator_password" {
  type    = string
  default = null
}

variable "identity_type" {
  type    = string
  default = "SystemAssigned"
}

# Storage

variable "auto_grow_enabled" {
  type    = bool
  default = true
}

variable "storage_mb" {
  type    = number
  default = 20480
}

# Encryption & SSL

variable "infrastructure_encryption_enabled" {
  type    = bool
  default = false
}

variable "ssl_enforcement_enabled" {
  type    = bool
  default = false
}

variable "ssl_minimal_tls_version_enforced" {
  type    = string
  default = "TLSEnforcementDisabled"
}


# Backup

variable "backup_retention_days" {
  type    = number
  default = 7
}

variable "geo_redundant_backup_enabled" {
  type    = bool
  default = false
}

variable "creation_source_server_id" {
  type    = string
  default = null
}

variable "restore_point_in_time" {
  type    = string
  default = null
}

# Threat Detection

variable "threat_detection_policy" {
  type    = list(any)
  default = []
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