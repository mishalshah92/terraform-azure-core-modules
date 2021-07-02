# AKS - Azure Kubernetes Service

Terraform modules create managed Kubernetes Cluster in Azure.

## Development

```hcl-terraform

module "aks_cluster" {
  source = "git::https://github.com/cloudops92/terraform-azure-modules.git//aks"

  name          = "containerRegistry1"
  subnet_id     = "my-subnet-id"

  default_node_pool = {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity = {
    type = "SystemAssigned"
  }
  
  resource_group  = "my-resourcegroup"
  location        = "centralindia"

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

## Ref

- <https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster>