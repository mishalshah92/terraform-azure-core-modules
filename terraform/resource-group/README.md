# Azure Resource Group

Terraform modules create Resource Group in Azure.

## Development

```hcl-terraform

module "resource-group" {
  source = "git@bitbucket.org:ownerteam/terraform-azure-modules.git//terraform/resource-group"
  
  name      = "my-resource-group"
  location  = "Central India"
  
  customer   = "owner"
  env        = "learn"
  owner      = "owner"
  email      = "devops@owner.ai"
  repo       = "https://bitbucket.org/ownerteam/terraform-azure-modules"
}

```
 
- **Variables**: For info on variables, check [file](variables.tf)
- **Outputs**: For info on outputs, check [file](outputs.tf)