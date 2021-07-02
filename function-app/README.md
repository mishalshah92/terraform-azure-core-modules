# Function App

Terraform modules create Azure function.

## Development

```hcl-terraform

module "function_app" {
  source = "git::https://github.com/cloudops92/terraform-azure-modules.git//function-app"

  name                = "containerRegistry1"
  location            = "centralindia"
  app_service_plan_id = "app-pla-test"

  # Storage Account
  storage_account_name = "my-app-storage-acc"
  storage_account_access_key = "accesskey"

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