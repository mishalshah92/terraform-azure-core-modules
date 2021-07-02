variable "name" {
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