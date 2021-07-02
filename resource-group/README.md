# Resource Group

Terraform modules create Resource Group in Azure.

## Development

```hcl-terraform

module "resource-group" {
  source = "git::https://github.com/cloudops92/terraform-azure-modules.git//resource-group"
  
  name      = "my-resource-group"
  location  = "Central India"
  
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