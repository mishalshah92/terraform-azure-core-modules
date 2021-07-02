variable "name" {
  type = string
}

variable "virtual_network_name" {
  type = string
}

variable "sku" {
  type    = string
  default = "Standard"
}

variable "idle_timeout_in_minutes" {
  type    = number
  default = 4
}

variable "zones" {
  type    = list(any)
  default = []
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