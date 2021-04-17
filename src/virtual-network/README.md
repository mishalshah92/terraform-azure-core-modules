# Virtual Network

Terraform modules create Virtual Network in Azure.

## Development

```hcl-terraform

module "vnet" {
  source = "git::https://github.com/cloudops92/terraform-azure-base-modules.git//src/virtual-network"

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