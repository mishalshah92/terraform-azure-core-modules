variable "location" {
  type = string
}

variable "name" {
  type = string
}

variable "account_kind" {
  type    = string
  default = "StorageV2"
}

variable "account_tier" {
  type    = string
  default = "Standard"
}

variable "account_replication_type" {
  type    = string
  default = "LRS"
}

variable "enable_https_traffic_only" {
  type    = bool
  default = true
}

variable "min_tls_version" {
  type    = string
  default = "TLS1_0"
}

variable "allow_blob_public_access" {
  type    = bool
  default = false
}

variable "large_file_share_enabled" {
  type    = bool
  default = false
}

variable "network_rules" {
  type    = list
  default = []
}

variable "custom_domain" {
  type    = list
  default = []
}

variable "blob_properties" {
  type    = list
  default = []
}

variable "identity" {
  type    = list
  default = []
}

variable "queue_properties" {
  type    = list
  default = []
}

variable "static_website" {
  type    = list
  default = []
}

# Tags

variable "customer" {
  type = string
}

variable "owner" {
  type = string
}

variable "email" {
  type = string
}

variable "env" {
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