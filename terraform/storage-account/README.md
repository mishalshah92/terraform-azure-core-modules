# Azure Storage Account

Terraform modules create and manage Storage account in Azure.

## Development

```hcl-terraform

module "storage-account" {
  source = "git@github.com/mishah92/terraform-azure-modules.git//terraform/storage-account"

  name     = "mystorageacc"
  location = "westIndia"

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