variable "name" {
  type = string
}

variable "backend_address_pools" {
  type = list(any)
}

variable "backend_http_settings" {
  type = list(any)
}

variable "authentication_certificates" {
  type    = list(any)
  default = []
}

variable "trusted_root_certificates" {
  type    = list(any)
  default = []
}

variable "frontend_ip_configurations" {
  type = list(any)
}

variable "frontend_ports" {
  type = list(any)
}

variable "gateway_ip_configurations" {
  type = list(any)
}

variable "http_listeners" {
  type = list(any)
}

variable "custom_error_configurations" {
  type    = list(any)
  default = []
}

## Identity
variable "identity_type" {
  type    = string
  default = null
}

variable "identity_ids" {
  type    = list(any)
  default = []
}

variable "request_routing_rules" {
  type = list(any)
}

variable "sku" {
  type    = map(any)
  default = null
}

variable "zones" {
  type    = list(any)
  default = null
}

variable "ssl_policy" {
  type    = list(any)
  default = []
}

variable "enable_http2" {
  type    = bool
  default = false
}

variable "probes" {
  type    = list(any)
  default = []
}

variable "ssl_certificates" {
  type    = list(any)
  default = []
}

variable "url_path_maps" {
  type    = list(any)
  default = []
}

variable "firewall_policy_id" {
  type    = string
  default = null
}

variable "redirect_configuration" {
  type    = map(any)
  default = null
}

variable "autoscale_configuration" {
  type    = map(any)
  default = null
}

variable "rewrite_rule_set" {
  type    = list(any)
  default = []
}

# Defaults

variable "resource_group" {
  type = string
}

variable "location" {
  type = string
}

# tags
variable "tags" {
  type    = map(string)
  default = {}
}