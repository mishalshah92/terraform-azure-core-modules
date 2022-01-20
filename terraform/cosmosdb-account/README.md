# Azure Cosmosdb Account

Terraform modules create CosmosDB account in Azure.

## Development

```hcl-terraform

module "cosmosdb_account" {
  source = "git::https://github.com/cloudops92/terraform-azure-modules.git//terraform/cosmosdb-account"

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