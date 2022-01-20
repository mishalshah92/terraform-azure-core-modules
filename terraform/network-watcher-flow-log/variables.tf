variable "network_watcher_name" {
  type = string
}
variable "network_security_group_id" {
  type = string
}

variable "storage_account_id" {
  type = string
}

variable "enabled" {
  type    = bool
  default = true
}

variable "enable_retention_policy" {
  type    = bool
  default = false
}

variable "retention_days" {
  type    = number
  default = 0
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