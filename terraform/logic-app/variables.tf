variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "integration_service_environment_id" {
  type    = string
  default = null
}

variable "logic_app_integration_account_id" {
  type    = string
  default = null
}

variable "workflow_schema" {
  type    = string
  default = null
}

variable "workflow_version" {
  type    = string
  default = null
}

variable "parameters" {
  type    = map(any)
  default = {}
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