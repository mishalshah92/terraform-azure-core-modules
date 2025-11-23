# Azure Key-Vault

Terraform modules create key-vault in Azure.

## Development

```hcl-terraform

module "key_vault" {
  source = "git::https://github.com/mishalshah92/terraform-azure-core-modules.git//terraform/key-vault"

  name          = "containerRegistry1"
  location      = "centralindia"

  # Tags
  customer       = "owner"
  env            = "learn"
  owner          = "owner"
  email          = "test@owner.ai"
  repo           = "https://github.com/mishalshah92/terraform-azure-modules"
  resource_group = "my-resourcegroup"
  deployment     = "default"
  module         = "test"
}

```
 
- **Variables**: For info on variables, check [file](variables.tf)
- **Outputs**: For info on outputs, check [file](outputs.tf)