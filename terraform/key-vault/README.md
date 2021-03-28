# Azure Key-Vault

Terraform modules create key-vault in Azure.

## Development

```hcl-terraform

module "key_vault" {
  source = "git::https://github.com/mishah92/terraform-azure-modules.git//terraform/key-vault"

  name          = "containerRegistry1"
  location      = "centralindia"

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