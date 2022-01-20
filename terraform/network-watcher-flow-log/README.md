# Azure Network Watcher Flow Log

Terraform modules create network flow log configurations in Azure for NSG.

## Development

```hcl-terraform

module "nsg-flow-logs" {
  source = "git::https://github.com/cloudops92/terraform-azure-modules.git//terraform/network-watcher-flow-log"

  network_watcher_name  = "vnet-net-watcher"
  resource_group        = "my-resource-group"

  network_security_group_id = "public-nsg"
  storage_account_id        = "myresourcegroupsa"

  enable_retention_policy = true
  retention_days          = 7
}

```
 
- **Variables**: For info on variables, check [file](variables.tf)
- **Outputs**: For info on outputs, check [file](outputs.tf)