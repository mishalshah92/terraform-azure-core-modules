# Azure DNS Zone Public

Terraform modules create Public DNS zone in Azure.

## Development

```hcl-terraform

module "container_registry" {
  source = "git@bitbucket.org:ownerteam/terraform-azure-modules.git//terraform/container-registry"

  name          = "containerRegistry1"
  sku           = "Standard"
  admin_enabled = false

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