variable "network_watcher_name" {
  type = string
}

variable "resource_group" {
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