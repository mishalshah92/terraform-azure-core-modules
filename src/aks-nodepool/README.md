# Azure AKS Node Pool

Terraform module to create node pool for Kubernetes Cluster in Azure with AKS service.

## Development

```hcl-terraform

module "aks_nodepool" {
  source = "git@https://github.com/mishah92/terraform-azure-modules.git//src/aks-nodepool"

  name                  = "containerRegistry1"
  kubernetes_cluster_id = "cluster/id"
  vm_size               = "Standard_BSv3"

  # Tags
  customer       = "customer"
  env            = "learn"
  owner          = "customer"
  email          = "test@customer.com"
  repo           = "https://github.com/mishah92/terraform-azure-modules"
  resource_group = "my-resourcegroup"
  deployment     = "default"
  module         = "test"
}

```
 
- **Variables**: For info on variables, check [file](variables.tf)
- **Outputs**: For info on outputs, check [file](outputs.tf)