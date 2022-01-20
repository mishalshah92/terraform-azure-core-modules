variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "virtual_network_name" {
  type = string
}

variable "address_prefixes" {
  type = list(any)
}

variable "service_endpoints" {
  type    = list(any)
  default = null
}

variable "enforce_private_link_endpoint_network_policies" {
  type    = bool
  default = false
}

variable "enforce_private_link_service_network_policies" {
  type    = bool
  default = false
}

variable "nsg_name" {
  type    = string
  default = null
}

variable "nsg_rules" {
  type    = map(any)
  default = {}
}

variable "disable_bgp_route_propagation" {
  type    = bool
  default = true
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