variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "target_resource_id" {
  type = string
}

variable "enabled" {
  type    = bool
  default = true
}

variable "profile" {
  type = list(any)
}

variable "notification" {
  type    = map(any)
  default = null
}

# tags
variable "tags" {
  type    = map(string)
  default = {}
}