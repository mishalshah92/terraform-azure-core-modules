# Azure Application Gateway

Terraform modules to create Application Gateway in Azure.

## Development

```hcl-terraform

module "application_gateway" {
  source = "git@bitbucket.org:ownerteam/terraform-azure-modules.git//terraform/application-gateway"

  name          = "containerRegistry1"
  location      = "centralindia"
  ...

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