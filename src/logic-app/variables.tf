variable "name" {
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

# Default

variable "location" {
  type = string
}

variable "resource_group" {
  type = string
}

# tags
variable "tags" {
  type    = map(string)
  default = {}
}