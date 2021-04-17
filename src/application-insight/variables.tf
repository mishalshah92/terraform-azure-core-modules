variable "name" {
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

# Default

variable "resource_group" {
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