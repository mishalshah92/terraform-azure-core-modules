variable "name" {
  type = string
}

variable "computer_name_prefix" {
  type    = string
  default = null
}

variable "location" {
  type = string
}

## OS

variable "source_image_id" {
  type = string
}

variable "upgrade_mode" {
  type    = string
  default = "Rolling"
}

variable "admin_username" {
  type    = string
  default = "azureuser"
}

variable "admin_password" {
  type    = string
  default = null
}

variable "admin_ssh_keys" {
  type    = list(any)
  default = []
}

variable "automatic_os_upgrade_policy" {
  type    = map(any)
  default = null
}

variable "automatic_instance_repair_grace_period" {
  type    = string
  default = null
}

variable "boot_diagnostics_storage_account" {
  type    = string
  default = null
}

variable "terminate_notification_timeout" {
  type    = number
  default = 10
}

variable "base64_encoded_custom_data" {
  type    = string
  default = null
}

## Scaling

variable "do_not_run_extensions_on_overprovisioned_machines" {
  type    = bool
  default = false
}

variable "proximity_placement_group_id" {
  type    = string
  default = null
}

variable "priority" {
  type    = string
  default = "Regular"
}

variable "provision_vm_agent" {
  type    = bool
  default = true
}

variable "number_of_instances" {
  type    = number
  default = 2
}

variable "vm_type" {
  type    = string
  default = "Standard_F2"
}

variable "overprovision" {
  type    = bool
  default = false
}

variable "rolling_upgrade_policy" {
  type    = map(any)
  default = null
}

variable "single_placement_group" {
  type    = bool
  default = true
}

variable "zone_balance" {
  type    = bool
  default = true
}

variable "zones" {
  type    = list(any)
  default = null
}

variable "scale_in_policy" {
  type    = string
  default = "Default"
}


# Network

variable "network_interfaces" {
  type    = list(any)
  default = []
}

# Storage

variable "encryption_at_host_enabled" {
  type    = bool
  default = false
}

variable "caching" {
  type    = string
  default = "ReadWrite"
}

variable "storage_account_type" {
  type    = string
  default = "StandardSSD_LRS"
}

variable "disk_size_gb" {
  type    = number
  default = 30
}

variable "write_accelerator_enabled" {
  type    = bool
  default = false
}

variable "diff_disk_settings_option" {
  type    = string
  default = null
}

variable "disk_encryption_set_id" {
  type    = string
  default = null
}

variable "ultra_ssd_enabled" {
  type    = bool
  default = false
}

variable "data_disk" {
  type    = list(any)
  default = []
}

## Secrets

variable "secret" {
  type    = map(any)
  default = null
}

## Health-check

variable "health_probe_id" {
  type    = string
  default = null
}

## Identity
variable "identity_type" {
  type    = string
  default = null
}

variable "identity_ids" {
  type    = list(any)
  default = []
}

# Extension

variable "extensions" {
  type    = list(any)
  default = []
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