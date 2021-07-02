# Virtual Network

Terraform modules create Virtual Network in Azure.

## Development

```hcl-terraform

module "vnet" {
  source = "git::https://github.com/cloudops92/terraform-azure-modules.git//virtual-network"

  name            = "my-vnet"
  resource_group  = "my-resourcegroup"
  location        = "centralindia"
  address_spaces  = [
    "10.0.0.0/16"
  ]
  enable_ddos = false

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