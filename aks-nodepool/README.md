# AKS (Azure Kubernetes Service) Node Pool

Terraform module to create node pool for Kubernetes Cluster in Azure with AKS service.

## Development

```hcl-terraform

module "aks_nodepool" {
  source = "git@https://github.com/cloudops92/terraform-azure-modules.git//aks-nodepool"

  name                  = "containerRegistry1"
  kubernetes_cluster_id = "cluster/id"
  vm_size               = "Standard_BSv3"

  resource_group = "my-resourcegroup"

  # tags
  tags = {
    env            = "learn"
    owner          = "customer"
    email          = "test@example.com"
    deployment     = "default"
  }
}

```
 
- **Variables**: For info on variables, check [file](variables.tf)
- **Outputs**: For info on outputs, check [file](outputs.tf)