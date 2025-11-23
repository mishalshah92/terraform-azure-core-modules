# Azure Resource Group

Terraform modules create Resource Group in Azure.

## Development

```hcl-terraform

module "resource-group" {
  source = "git::https://github.com/mishalshah92/terraform-azure-core-modules.git//terraform/resource-group"
  
  name      = "my-resource-group"
  location  = "Central India"
  
  customer   = "owner"
  env        = "learn"
  owner      = "owner"
  email      = "devops@owner.ai"
  repo       = "https://github.com/mishalshah92/terraform-azure-core-modules"
}

```
 
- **Variables**: For info on variables, check [file](variables.tf)
- **Outputs**: For info on outputs, check [file](outputs.tf)