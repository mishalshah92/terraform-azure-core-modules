variable "name" {
  type = string
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