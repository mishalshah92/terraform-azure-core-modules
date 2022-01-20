variable "resource_group_name" {
  type    = string
  default = "null"
}

variable "docker_compose_content" {
  type = string
}

# Docker login

variable "docker_login" {
  type    = bool
  default = false
}

variable "login_server" {
  type    = string
  default = "null"
}

variable "username" {
  type    = string
  default = "null"
}

variable "password" {
  type    = string
  default = "null"
}

# Azure login

variable "azure_identity_login" {
  type    = bool
  default = false
}

variable "azure_user_identity_object_id" {
  type    = string
  default = "null"
}

# Azure ACR login

variable "acr_login" {
  type    = bool
  default = false
}

# ELK Settings

variable "elk_settings" {
  type    = bool
  default = false
}

variable "elk_data_path" {
  type    = string
  default = "null"
}

# File-share

variable "file_share_settings" {
  type    = bool
  default = false
}

variable "file_share_storage_account_name" {
  type    = string
  default = "null"
}

variable "file_share_name" {
  type    = string
  default = "null"
}

variable "file_share_mount_path" {
  type    = string
  default = "null"
}

variable "file_share_gid" {
  type    = number
  default = 0
}

variable "file_share_uid" {
  type    = number
  default = 0
}

# Telegraf

variable "enable_telegraf" {
  type    = bool
  default = false
}

variable "telegraf_out_influxdb_host" {
  type    = string
  default = "null"
}

variable "telegraf_out_influxdb_token" {
  type    = string
  default = "null"
}

variable "telegraf_out_influxdb_org" {
  type    = string
  default = "null"
}

variable "telegraf_out_influxdb_bucket" {
  type    = string
  default = "null"
}

# Tags

variable "tags" {
  type    = map(string)
  default = {}
}