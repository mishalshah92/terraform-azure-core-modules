variable "name" {
  type = string
}

variable "sku_name" {
  type    = string
  default = "standard"
}

# Config

variable "enabled_vm_for_deployment" {
  type    = bool
  default = true
}

variable "enabled_for_disk_encryption" {
  type    = bool
  default = true
}

variable "enabled_for_template_deployment" {
  type    = bool
  default = false
}

variable "enable_rbac_authorization" {
  type    = bool
  default = false
}

variable "purge_protection_enabled" {
  type    = bool
  default = false
}

variable "soft_delete_enabled" {
  type    = bool
  default = true
}

variable "soft_delete_retention_days" {
  type    = number
  default = 7
}

# Network

variable "network_bypass" {
  type    = string
  default = "None"
}

variable "network_default_action" {
  type    = string
  default = "Deny"
}

variable "network_ip_rules" {
  type    = list(any)
  default = null
}

variable "virtual_network_subnet_ids" {
  type    = list(any)
  default = null
}

# Notifications

variable "contacts" {
  type    = list(any)
  default = []
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