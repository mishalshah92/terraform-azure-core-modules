# Storage Account

Terraform modules create and manage Storage account in Azure.

## Development

```hcl-terraform

module "storage-account" {
  source = "git::https://github.com/cloudops92/terraform-azure-base-modules.git//src/storage-account"

  name     = "mystorageacc"
  location = "westIndia"

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