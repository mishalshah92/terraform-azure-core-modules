variable "name" {
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

# Default

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