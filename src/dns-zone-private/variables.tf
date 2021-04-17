variable "name" {
  type = string
}

variable "soa_record" {
  type    = map(any)
  default = {}
}

# Default

variable "resource_group" {
  type = string
}

# tags

variable "tags" {
  type    = map(string)
  default = {}
}