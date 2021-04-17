# help: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#default_node_pool

variable "name" {
  description = "Name of the Kubernetes cluster."
  type        = string
}

variable "default_node_pool" {
  description = "Default node pool configuration as defined on module help"
  type        = list(any)
}

variable "default_node_pool_tags" {
  description = "Default node pool tags configuration as defined on module help"
  type        = map(any)
  default     = null
}

variable "dns_prefix" {
  description = "DNS prefix specified when creating the managed cluster. Changing this forces a new resource to be created. The dns_prefix must contain between 3 and 45 characters, and can contain only letters, numbers, and hyphens. It must start with a letter and must end with a letter or a number."
  type        = string
}

variable "api_server_authorized_ip_ranges" {
  description = "The IP ranges to whitelist for incoming traffic to the masters."
  type        = list(any)
  default     = []
}

variable "auto_scaler_profile" {
  description = "A auto_scaler_profile block."
  type        = list(any)
  default     = []
}

variable "disk_encryption_set_id" {
  description = "The ID of the Disk Encryption Set which should be used for the Nodes and Volumes."
  type        = string
  default     = null
}

## Identity
variable "identity_type" {
  type    = string
  default = "System"
}

variable "user_assigned_identity_id" {
  type    = string
  default = null
}

variable "kubernetes_version" {
  description = "Version of Kubernetes specified when creating the AKS managed cluster. If not specified, the latest recommended version will be used at provisioning time (but won't auto-upgrade)."
  type        = string
  default     = null
}

variable "linux_profile" {
  description = "Linux profile."
  type        = list(any)
  default     = []
}

variable "windows_profile" {
  description = "Windows profile."
  type        = list(any)
  default     = []
}

variable "network_profile" {
  description = "Network profile."
  type        = list(any)
  default     = []
}

variable "network_load_balancer_profile" {
  description = "Network profile for load-balancer."
  type        = list(any)
  default     = []
}

variable "node_resource_group" {
  description = "The name of the Resource Group where the Kubernetes Nodes should exist. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "private_cluster_enabled" {
  description = "Should this Kubernetes Cluster have its API server only exposed on internal IP addresses? This provides a Private IP Address for the Kubernetes API on the Virtual Network where the Kubernetes Cluster is located."
  type        = bool
  default     = true
}

variable "role_based_access_control" {
  description = "The name of the Resource Group where the Kubernetes Nodes should exist. Changing this forces a new resource to be created."
  type        = list(any)
  default     = []
}

variable "service_principal" {
  description = "A service_principal block."
  type        = list(any)
  default     = []
}

variable "sku_tier" {
  description = "The SKU Tier that should be used for this Kubernetes Cluster."
  type        = string
  default     = "Free"
}

variable "addon_profile" {
  description = "A addons block."
  type        = list(any)
  default     = []
}

# Default

variable "resource_group" {
  description = "Resource Group of the Cluster."
  type        = string
}

variable "location" {
  description = "Location of the Kubernetes cluster"
  type        = string
}

# tags
variable "tags" {
  type    = map(string)
  default = {}
}