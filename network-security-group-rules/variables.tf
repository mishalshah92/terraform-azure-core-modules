variable "network_security_group_name" {
  type = string
}

variable "nat_gateway_rules" {
  type    = map(any)
  default = {}
}

variable "nat_gateway_rule_ranges" {
  type    = map(any)
  default = {}
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