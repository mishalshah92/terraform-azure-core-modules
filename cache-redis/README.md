# Cache Redis

Terraform modules create `Azure Cache for Redis`.

## Development

```hcl-terraform

module "cache_redis" {
  source = "git::https://github.com/cloudops92/terraform-azure-modules.git//cache-redis"

  name          = "containerRegistry1"
  subnet_id     = "my-subnet-id"

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