variable "name" {
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

# tags

variable "resource_group" {
  type = string
}