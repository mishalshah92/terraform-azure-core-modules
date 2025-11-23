# Azure Logic App

Terraform modules create Logic App.

## Development

```hcl-terraform

module "logic_app" {
  source = "git::https://github.com/mishalshah92/terraform-azure-core-modules.git//terraform/logic_app"

  name     = "my-vnet-peering"
  location = "eastus"
  
  # Tags
  customer       = "owner"
  env            = "learn"
  owner          = "owner"
  email          = "test@owner.ai"
  repo           = "https://github.com/mishalshah92/terraform-azure-modules"
  resource_group = "my-resourcegroup"
  deployment     = "default"
  module         = "test"
}

```
 
- **Variables**: For info on variables, check [file](variables.tf)
- **Outputs**: For info on outputs, check [file](outputs.tf)