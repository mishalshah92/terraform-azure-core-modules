# Key-Vault

Terraform modules create key-vault in Azure.

## Development

```hcl-terraform

module "key_vault" {
  source = "git::https://github.com/cloudops92/terraform-azure-base-modules.git//src/key-vault"

  name          = "containerRegistry1"
  location      = "centralindia"

  resource_group  = "my-resourcegroup"
  location        = "centralindia"

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