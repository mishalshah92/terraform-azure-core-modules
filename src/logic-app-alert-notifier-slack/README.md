# Logic App Alert Notifier Slack

Terraform modules create Logic App for pushing Azure alerts to Slack channel.

## Development

```hcl-terraform

module "logic_app_alert_notifier_slack" {
  source = "git::https://github.com/cloudops92/terraform-azure-modules.git//src/logic-app-alert-notifier-slack"

  name     = "my-vnet-peering"
  location = "eastus"
  
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