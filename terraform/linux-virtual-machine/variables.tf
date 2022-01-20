variable "name" {
  type = string
}

variable "location" {
  type = string
}

# Secrets

variable "secret" {
  type    = map(any)
  default = {}
}

# Source Image

variable "source_image_id" {
  type    = string
  default = null
}

variable "source_image_reference" {
  type    = list(any)
  default = []
}

# identity

variable "identity_type" {
  type    = string
  default = null
}

variable "identity_ids" {
  type    = list(any)
  default = []
}

variable "admin_username" {
  type = string
}

variable "admin_ssh_keys" {
  type    = list(any)
  default = []
}

# Config

variable "size" {
  type    = string
  default = "Standard_F2"
}

variable "virtual_machine_scale_set_id" {
  type    = string
  default = null
}

variable "proximity_placement_group_id" {
  type    = string
  default = null
}

variable "base64_custom_data" {
  type    = string
  default = null
}

variable "priority" {
  type    = string
  default = "Regular"
}


# Network

variable "subnet_id" {
  type = string
}

variable "enable_ip_forwarding" {
  type    = bool
  default = false
}

variable "enable_accelerated_networking" {
  type    = bool
  default = false
}

variable "public_ip_address_id" {
  type    = string
  default = null
}

variable "private_ip_address_version" {
  type    = string
  default = "IPv4"
}

variable "private_ip_address_allocation" {
  type    = string
  default = "Dynamic"
}

variable "private_ip_address" {
  type    = string
  default = null
}

variable "primary_ip_config" {
  type    = bool
  default = false
}

variable "zone" {
  type    = string
  default = null
}

# Storage

variable "encryption_at_host_enabled" {
  type    = bool
  default = true
}

variable "caching" {
  type    = string
  default = "ReadWrite"
}

variable "storage_account_type" {
  type    = string
  default = "Standard_LRS"
}

variable "disk_size_gb" {
  type    = number
  default = 30
}

variable "write_accelerator_enabled" {
  type    = bool
  default = false
}

variable "disk_encryption_set_id" {
  type    = string
  default = null
}

# Shutdown

variable "auto_shutdown_enabled" {
  type    = bool
  default = false
}

variable "auto_shutdown_time" {
  type    = string
  default = "2000"
}

# Possible Timezone: https://jackstromberg.com/2017/01/list-of-time-zones-consumed-by-azure/
variable "auto_shutdown_timezone" {
  type    = string
  default = "UTC"
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