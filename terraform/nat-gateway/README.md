# Azure Network Gateway

Terraform modules create Network Gateway in Azure.

## Development

```hcl-terraform

module "nat-gateway" {
  source = "git@github.com/mishah92/terraform-azure-modules.git//terraform/nat-gateway"

  name                 = "my-vnet-peering"
  location             = "centralindia"
  virtual_network_name = "my-vnet"
  sku                  = "Standard"
  
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