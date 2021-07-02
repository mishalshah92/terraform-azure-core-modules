variable "name" {
  type = string
}

variable "soa_record" {
  type    = map(any)
  default = {}
}

variable "resource_group" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}