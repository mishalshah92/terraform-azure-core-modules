# Azure Kubernetes Service

Terraform modules create managed Kubernetes Cluster in Azure.

## Development

```hcl-terraform

module "aks_cluster" {
  source = "git@github.com/mishah92/terraform-azure-modules.git//terraform/aks"

  name          = "containerRegistry1"
  location      = "centralindia"
  subnet_id     = "my-subnet-id"

  default_node_pool = {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity = {
    type = "SystemAssigned"
  }
  
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