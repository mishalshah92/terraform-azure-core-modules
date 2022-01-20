# Azure Database Server - PostgreSQL

Terraform modules create Azure database for PostgreSQL.

## Development

```hcl-terraform

module "postgresql-db" {
  source = "git@bitbucket.org:ownerteam/terraform-azure-modules.git//terraform/database-server-postgresql"

  name     = "my-postgresql-db"
  location = "centralindia"
  
  # Config
  create_mode                   = "Default"
  sku_name                      = "GP_Gen5_4"
  db_version                    = "9.6"
  public_network_access_enabled = false

  # Auth
  administrator_username = "postgres"
  administrator_password = "admin@123"
  
  # Storage
  auto_grow_enabled = true
  storage_mb        = "10240" ## 10 GB

  # Encryption & SSL
  ssl_enforcement_enabled          = true
  ssl_minimal_tls_version_enforced = "TLS1_2"

  # Backup
  backup_retention_days        = 10
  geo_redundant_backup_enabled = false

  # Threat Detection
  threat_detection_policy = {
    enabled = false
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