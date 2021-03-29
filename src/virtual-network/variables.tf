variable "name" {
  type = string
}

variable "location" {
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