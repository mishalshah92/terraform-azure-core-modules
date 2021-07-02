variable "name" {
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