# Azure function-app

Terraform modules create Azure function.

## Development

```hcl-terraform

module "function_app" {
  source = "git::https://github.com/mishah92/terraform-azure-modules.git//terraform/function-app"

  name                = "containerRegistry1"
  location            = "centralindia"
  app_service_plan_id = "app-pla-test"

  # Storage Account
  storage_account_name = "my-app-storage-acc"
  storage_account_access_key = "accesskey"

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