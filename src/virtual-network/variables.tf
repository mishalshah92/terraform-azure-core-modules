variable "name" {
  type = string
}

variable "address_spaces" {
  type = list(any)
  default = [
    "10.0.0.0/16"
  ]
}

variable "dns_servers" {
  type    = list(any)
  default = []
}

variable "subnets" {
  type    = list(any)
  default = []
}

variable "enable_ddos" {
  type    = bool
  default = false
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