variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "keyvault_name" {
  type = string
}

# issuer_parameters

variable "issuer_parameters_name" {
  type = string
}

# key_properties

variable "exportable" {
  type    = bool
  default = false
}

variable "key_size" {
  type    = number
  default = 2048
}

variable "key_type" {
  type    = string
  default = "RSA"
}

variable "reuse_key" {
  type    = bool
  default = true
}

# lifetime_action

variable "action_type" {
  type    = string
  default = "AutoRenew"
}

variable "days_before_expiry" {
  type    = number
  default = 30
}

variable "lifetime_percentage" {
  type    = number
  default = 80
}

# secret_properties

variable "secret_content_type" {
  type    = string
  default = "application/x-pkcs12"
}

# x509_certificate_properties

variable "extended_key_usage" {
  type = list(any)
  default = [
    "1.3.6.1.5.5.7.3.1", # Server
    "1.3.6.1.5.5.7.3.2"  # Client
  ]
}

variable "key_usage" {
  type = list(string)
  default = [
    "cRLSign",
    "dataEncipherment",
    "digitalSignature",
    "keyAgreement",
    "keyCertSign",
    "keyEncipherment",
  ]
}

variable "subject" {
  type = string
}

variable "validity_in_months" {
  type    = number
  default = 12
}

## subject_alternative

variable "subject_alternative_dns_names" {
  type    = list(any)
  default = null
}

variable "subject_alternative_emails" {
  type    = list(any)
  default = null
}

variable "subject_alternative_upns" {
  type    = list(any)
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