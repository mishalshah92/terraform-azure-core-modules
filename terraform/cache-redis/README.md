# Azure Cache Redis

Terraform modules create redis cache in Azure.

## Development

```hcl-terraform

module "redis_cache" {
  source = "git::https://github.com/mishah92/terraform-azure-modules.git//terraform/cache-redis"

  name          = "containerRegistry1"
  location      = "centralindia"
  subnet_id     = "my-subnet-id"

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