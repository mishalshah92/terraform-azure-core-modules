# Network Gateway

Terraform modules create Network Gateway in Azure.

## Development

```hcl-terraform

module "nat-gateway" {
  source = "git::https://github.com/cloudops92/terraform-azure-base-modules.git//src/nat-gateway"

  name                 = "my-vnet-peering"
  location             = "centralindia"
  virtual_network_name = "my-vnet"
  sku                  = "Standard"
  
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