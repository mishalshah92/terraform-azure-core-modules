variable "name" {
  type = string
}

variable "location" {
  type = string
}


# Config

variable "sku_name" {
  type    = string
  default = "Standard"
}

variable "family" {
  type    = string
  default = "c"
}

variable "capacity" {
  type    = number
  default = 1
}

variable "shard_count" {
  type    = number
  default = 0
}

variable "patch_schedule" {
  type    = map(any)
  default = null
}


variable "redis_configurations" {
  type    = map(any)
  default = null
}

# Network

variable "subnet_id" {
  type = string
}

variable "zones" {
  type    = list(any)
  default = null
}

variable "public_network_access_enabled" {
  type    = bool
  default = false
}

variable "private_static_ip_address" {
  type    = string
  default = null
}

variable "minimum_tls_version" {
  type    = string
  default = "1.0"
}

variable "enable_non_ssl_port" {
  type    = bool
  default = false
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