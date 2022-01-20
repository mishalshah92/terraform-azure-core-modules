# Azure Route Table

Terraform modules create Route Table in Azure.

## Development

```hcl-terraform

module "route-table" {
  source = "git@bitbucket.org:ownerteam/terraform-azure-modules.git//terraform/route-table"

  name                = "my-route-table"
  
  routes = [
    {
      name           = "route1"
      address_prefix = "10.1.0.0/16"
      next_hop_type  = "vnetlocal"
    }
  ]

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