# Azure Logic App

Terraform modules create Logic App.

## Development

```hcl-terraform

module "logic_app" {
  source = "git@github.com/mishah92/terraform-azure-modules.git//terraform/logic_app"

  name     = "my-vnet-peering"
  location = "eastus"
  
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