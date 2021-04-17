# Logic App

Terraform modules create Logic App.

## Development

```hcl-terraform

module "logic_app" {
  source = "git::https://github.com/cloudops92/terraform-azure-base-modules.git//src/logic_app"

  name     = "my-vnet-peering"
  location = "eastus"
  
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