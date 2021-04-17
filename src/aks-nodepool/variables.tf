# help: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#default_node_pool

variable "name" {
  description = "Name of the Kubernetes cluster."
  type        = string
}

variable "kubernetes_cluster_id" {
  description = "Kubernetes cluster id for which the node pool to be created."
  type        = string
}

variable "vm_size" {
  description = "The SKU which should be used for the Virtual Machines used in this Node Pool."
  type        = string
}

variable "availability_zones" {
  description = "A list of Availability Zones where the Nodes in this Node Pool should be created in."
  type        = list(any)
  default     = null
}

variable "enable_auto_scaling" {
  description = "Whether to enable auto-scaler. Defaults to false."
  type        = bool
  default     = false
}

variable "eviction_policy" {
  description = "The Eviction Policy which should be used for Virtual Machines within the Virtual Machine Scale Set powering this Node Pool. Possible values are Deallocate and Delete. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "max_pods" {
  description = "The maximum number of pods that can run on each agent. Changing this forces a new resource to be created."
  type        = number
  default     = null
}

variable "mode" {
  description = "Should this Node Pool be used for System or User resources? Possible values are System and User."
  type        = string
  default     = "User"
}

variable "node_labels" {
  description = "A map of Kubernetes labels which should be applied to nodes in this Node Pool. Changing this forces a new resource to be created."
  type        = map(any)
  default     = {}
}

variable "node_taints" {
  description = "A list of Kubernetes taints which should be applied to nodes in the agent pool (e.g key=value:NoSchedule). Changing this forces a new resource to be created."
  type        = list(any)
  default     = null
}

variable "orchestrator_version" {
  description = "Version of Kubernetes used for the Agents. If not specified, the latest recommended version will be used at provisioning time (but won't auto-upgrade)."
  type        = string
  default     = null
}

variable "os_disk_size_gb" {
  description = "The Agent Operating System disk size in GB. Changing this forces a new resource to be created."
  type        = number
  default     = 30
}

variable "os_disk_type" {
  description = "The Operating System which should be used for this Node Pool. Changing this forces a new resource to be created. Possible values are Linux and Windows. Defaults to Linux."
  type        = string
  default     = "Linux"
}

variable "proximity_placement_group_id" {
  description = "The ID of the Proximity Placement Group where the Virtual Machine Scale Set that powers this Node Pool will be placed. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "priority" {
  description = "The Priority for Virtual Machines within the Virtual Machine Scale Set that powers this Node Pool. Possible values are Regular and Spot. Defaults to Regular."
  type        = string
  default     = "Regular"
}

variable "spot_max_price" {
  description = "The maximum price you're willing to pay in USD per Virtual Machine. Valid values are -1 (the current on-demand price for a Virtual Machine) or a positive value with up to five decimal places."
  type        = number
  default     = null
}

variable "vnet_subnet_id" {
  description = "The ID of the Subnet where this Node Pool should exist."
  type        = string
  default     = null
}

variable "node_count" {
  description = "The number of nodes which should exist within this Node Pool. Valid values are between 0 and 1000."
  type        = number
  default     = 1
}

variable "min_count" {
  description = "The minimum number of nodes which should exist within this Node Pool. Valid values are between 0 and 1000."
  type        = number
  default     = 1
}

variable "max_count" {
  description = "The maximum number of nodes which should exist within this Node Pool. Valid values are between 0 and 1000."
  type        = number
  default     = 5
}

# Default

variable "resource_group" {
  type = string
}

# tags
variable "tags" {
  type    = map(string)
  default = {}
}