# Azure Resource Group

Terraform modules create Resource Group in Azure.

## Development

```hcl-terraform

module "resource-group" {
  source = "git@github.com/mishah92/terraform-azure-modules.git//terraform/resource-group"
  
  name      = "my-resource-group"
  location  = "Central India"
  
  customer   = "customer"
  env        = "learn"
  owner      = "customer"
  email      = "devops@customer.com"
  repo       = "https://bitbucket.org/customerteam/terraform-azure-modules"
}

```
 
- **Variables**: For info on variables, check [file](variables.tf)
- **Outputs**: For info on outputs, check [file](outputs.tf)