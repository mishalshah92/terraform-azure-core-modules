variable "location" {
  type = string
}

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