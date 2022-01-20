variable "docker_compose_content" {
  type = string
}

variable "docker_login" {
  type    = bool
  default = false
}

variable "azure_identity_login" {
  type    = bool
  default = false
}

variable "azure_user_identity_object_id" {
  type    = string
  default = "null"
}

variable "acr_login" {
  type    = bool
  default = false
}

variable "login_server" {
  type    = string
  default = "no_url"
}

variable "username" {
  type    = string
  default = "no_username"
}

variable "password" {
  type    = string
  default = "no_password"
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

# Mount options

variable "mount_path" {
  type = string
}

variable "mount_disk" {
  type = string
}

# Tags

variable "tags" {
  type    = map(string)
  default = {}
}