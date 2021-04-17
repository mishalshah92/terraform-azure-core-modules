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
  type    = map(any)
  default = null
}

variable "custom_domain" {
  type    = map(any)
  default = null
}

variable "blob_properties" {
  type    = map(any)
  default = null
}

variable "identity" {
  type    = map(any)
  default = null
}

variable "queue_properties" {
  type    = map(any)
  default = null
}

variable "static_website" {
  type    = map(any)
  default = null
}

# Default

variable "location" {
  type = string
}

variable "resource_group" {
  type = string
}

# tags

variable "tags" {
  type    = map(string)
  default = {}
}