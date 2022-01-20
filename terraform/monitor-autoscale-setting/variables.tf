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