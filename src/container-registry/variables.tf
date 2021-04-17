variable "name" {
  type = string
}

variable "sku" {
  type    = string
  default = "Standard"
}

variable "admin_enabled" {
  type    = bool
  default = false
}

variable "georeplication_locations" {
  type    = list(any)
  default = null
}

# Networking

variable "network_rule_set" {
  type    = map(any)
  default = null
}

variable "retention_days" {
  type    = number
  default = 0
}

variable "trust_policy" {
  type    = bool
  default = false
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