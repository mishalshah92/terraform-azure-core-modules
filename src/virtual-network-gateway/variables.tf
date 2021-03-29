variable "name" {
  type = string
}

variable "location" {
  type = string
}

# virtual-network-gateway

variable "vpn_type" {
  type    = string
  default = "RouteBased"
}

variable "gateway_subnet_id" {
  type = string
}

variable "active_active" {
  type    = bool
  default = false
}

variable "enable_bgp" {
  type    = bool
  default = false
}

variable "sku" {
  type    = string
  default = "VpnGw1"
}

variable "generation" {
  type    = string
  default = "Generation1"
}

## vpn_client_configuration

variable "pts_address_spaces" {
  type = list(any)
}

variable "pts_vpn_client_protocols" {
  type = list(any)
  default = [
    "OpenVPN",
    "IkeV2"
  ]
}

variable "pts_root_certificate_name" {
  type = string
}

variable "pts_root_certificate_data" {
  type = string
}


# Public IP addresses

variable "ip_allocation_method" {
  type    = string
  default = "Dynamic"
}

variable "ip_idle_timeout_in_minutes" {
  type    = number
  default = 4
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