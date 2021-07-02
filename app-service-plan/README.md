# App Service Plan

Terraform modules create App Service plan in Azure.

## Development

```hcl-terraform

module "app_service_plan" {
  source = "git::https://github.com/cloudops92/terraform-azure-modules.git//app-service-plan"

  name              = "azure.abc.com"
  location          = "centralindia"
  application_type  = "web"
  kind              = "xenon"
  
  sku_tier = "PremiumContainer"
  sku_size = "PC2"

  resource_group = "my-resourcegroup"

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