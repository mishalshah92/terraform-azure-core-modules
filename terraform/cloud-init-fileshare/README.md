# Azure Cloud Init - FileShare

Terraform modules to generate the cloud-init file for mounting FileShare on VM.

## Development

```hcl-terraform

module "cloud-init-fileshare" {
  source = "git@bitbucket.org:ownerteam/terraform-azure-modules.git//terraform/cloud-init-fileshare"

  azure_identity_login   = true

  file_share_settings             = true
  file_share_storage_account_name = "my-storage"
  file_share_name                 = "datapath"
  file_share_mount_path           = "/data/path/"
  file_share_gid                  = 0
  file_share_uid                  = 0

  # Telegraf
  enable_telegraf               = true  
  telegraf_out_influxdb_host    = "http://influxdb.host.com"
  telegraf_out_influxdb_token   = "my_token"
  telegraf_out_influxdb_org     = "owner"
  telegraf_out_influxdb_bucket  = "default"

  # Tags
  tags = {
    Customer      = "customer"
    Env           = "env"
    Deployment    = "mydeployment"
    Email         = "test@owner.ai"
    Owner         = "test"
    ResourceGroup = "reg"
    Module        = "mumodule"
  }
}

```
 
- **Variables**: For info on variables, check [file](variables.tf)
- **Outputs**: For info on outputs, check [file](outputs.tf)