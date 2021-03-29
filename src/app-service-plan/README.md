# Azure App Service Plan

Terraform modules create App Service plan in Azure.

## Development

```hcl-terraform

module "app_service_plan" {
  source = "git::https://github.com/mishah92/terraform-azure-modules.git//src/app-service-plan"

  name              = "azure.abc.com"
  location          = "centralindia"
  application_type  = "web"
  kind              = "xenon"
  
  sku_tier = "PremiumContainer"
  sku_size = "PC2"

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