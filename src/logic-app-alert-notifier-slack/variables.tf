variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "integration_account_sku_name" {
  type    = string
  default = "Free"
}

variable "http_request_schema" {
  type = string
}

variable "javascript_code" {
  type = string
}

variable "slack_webhook_uri" {
  type = string
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