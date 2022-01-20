variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "kind" {
  type = string
}

variable "maximum_elastic_worker_count" {
  type    = number
  default = null
}

variable "app_service_environment_id" {
  type    = string
  default = null
}

variable "reserved" {
  type    = bool
  default = false
}

variable "per_site_scaling" {
  type    = bool
  default = false
}

# SKU

variable "sku_size" {
  type = string
}

variable "sku_tier" {
  type = string
}

variable "sku_capacity" {
  type    = number
  default = null
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