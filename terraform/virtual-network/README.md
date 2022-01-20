# Azure Virtual Network

Terraform modules create Virtual Network in Azure.

## Development

```hcl-terraform

module "vnet" {
  source = "git::https://github.com/cloudops92/terraform-azure-modules.git//terraform/virtual-network"

  name           = "my-vnet"
  address_spaces = [
    "10.0.0.0/16"
  ]
  subnets = [
    {
      name : "app-subnet"
      address_prefix : "10.0.10.0/20"
      security_group : "app-subnet-nsg"
    }
  ]
  enable_ddos = false

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