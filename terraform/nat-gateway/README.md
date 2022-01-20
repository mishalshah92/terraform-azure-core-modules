# Azure Network Gateway

Terraform modules create Network Gateway in Azure.

## Development

```hcl-terraform

module "nat-gateway" {
  source = "git::https://github.com/cloudops92/terraform-azure-modules.git//terraform/nat-gateway"

  name                 = "my-vnet-peering"
  location             = "centralindia"
  virtual_network_name = "my-vnet"
  sku                  = "Standard"
  
  # Tags
  customer       = "owner"
  env            = "learn"
  owner          = "owner"
  email          = "test@owner.ai"
  repo           = "https://github.com/cloudops92/terraform-azure-modules"
  resource_group = "my-resourcegroup"
  deployment     = "default"
  module         = "test"
}

```
 
- **Variables**: For info on variables, check [file](variables.tf)
- **Outputs**: For info on outputs, check [file](outputs.tf)