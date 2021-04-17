variable "name" {
  type = string
}

variable "disable_bgp_route_propagation" {
  type    = bool
  default = true
}

variable "routes" {
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