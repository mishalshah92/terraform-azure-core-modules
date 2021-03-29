variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "offer_type" {
  type = string
}

variable "kind" {
  type = string
}

variable "enable_automatic_failover" {
  type    = bool
  default = true
}

variable "enable_free_tier" {
  type    = bool
  default = false
}

variable "public_network_access_enabled" {
  type    = bool
  default = false
}

variable "is_virtual_network_filter_enabled" {
  type    = bool
  default = false
}

variable "enable_multiple_write_locations" {
  type    = bool
  default = false
}

variable "key_vault_key_id" {
  type    = string
  default = null
}

variable "virtual_network_rule" {
  type    = list(any)
  default = []
}

variable "capabilities" {
  type    = list(any)
  default = []
}

variable "consistency_policy" {
  type = list(any)
}

variable "geo_locations" {
  type = list(any)
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