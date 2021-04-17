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
  default = null
}

variable "acr_login" {
  type    = bool
  default = false
}

variable "login_server" {
  type    = string
  default = null
}

variable "username" {
  type    = string
  default = null
}

variable "password" {
  type    = string
  default = null
}