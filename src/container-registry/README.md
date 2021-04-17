# DNS Zone Public

Terraform modules create Public DNS zone in Azure.

## Development

```hcl-terraform

module "container_registry" {
  source = "git::https://github.com/cloudops92/terraform-azure-base-modules.git//src/container-registry"

  name          = "containerRegistry1"
  sku           = "Standard"
  admin_enabled = false

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