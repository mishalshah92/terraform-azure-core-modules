# Azure Cache Redis

Terraform modules create redis cache in Azure.

## Development

```hcl-terraform

module "redis_cache" {
  source = "git::https://github.com/cloudops92/terraform-azure-modules.git//terraform/cache-redis"

  name          = "containerRegistry1"
  location      = "centralindia"
  subnet_id     = "my-subnet-id"

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