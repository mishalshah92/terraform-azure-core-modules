# Azure Subnet-RT-NSG

Terraform modules create Subnet and its route-table and network-security-group in Azure and perform its associations.

## Development

```hcl-terraform

module "subnet" {
  source = "git@bitbucket.org:ownerteam/terraform-azure-modules.git//terraform/subnet-rt-nsg"

  name                  = "my-route-table"
  location              = "centralindia"
  virtual_network_name  = "my-vnet"
  address_prefixes      = [10.0.10.0/24]
  nsg_name              = "my-route-table-nsg"
  rt_name               = "my-route-table-rt"

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