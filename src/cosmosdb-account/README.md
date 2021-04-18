# Cosmosdb Account

Terraform modules create CosmosDB account in Azure.

## Development

```hcl-terraform

module "cosmosdb_account" {
  source = "git::https://github.com/cloudops92/terraform-azure-modules.git//src/cosmosdb-account"

  name       = "containerRegistry1"
  location   = "centralindia"
  offer_type = "Standard"
  kind       = "GlobalDocumentDB"

  enable_automatic_failover = true

  consistency_policy = {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 10
    max_staleness_prefix    = 200
  }

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