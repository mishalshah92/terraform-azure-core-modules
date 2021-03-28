variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "application_type" {
  type = string
}

variable "daily_data_cap_in_gb" {
  type    = number
  default = null
}

variable "daily_data_cap_notifications_disabled" {
  type    = bool
  default = true
}

variable "retention_in_days" {
  type    = number
  default = 90
}

variable "sampling_percentage" {
  type    = number
  default = null
}

variable "disable_ip_masking" {
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