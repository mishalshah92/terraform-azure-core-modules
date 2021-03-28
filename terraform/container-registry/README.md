# Azure DNS Zone Public

Terraform modules create Public DNS zone in Azure.

## Development

```hcl-terraform

module "container_registry" {
  source = "git::https://github.com/mishah92/terraform-azure-modules.git//terraform/container-registry"

  name          = "containerRegistry1"
  sku           = "Standard"
  admin_enabled = false

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