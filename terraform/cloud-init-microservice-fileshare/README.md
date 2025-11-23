# Azure Cloud Init Microservice Fileshare

Terraform modules to generate the cloud-init file for deploying micro-service on VM with FileShare mount.

## Development

```hcl-terraform

module "cloud-init-microservice-fileshare" {
  source = "git::https://github.com/mishalshah92/terraform-azure-core-modules.git//terraform/cloud-init-microservice-fileshare"

  azure_identity_login   = true
  acr_login              = true
  docker_login           = false
  login_server           = "owneracr.azure.io"
  docker_compose_content = file("docker-compose.yml")

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