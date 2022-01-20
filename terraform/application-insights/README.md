# Azure Application Insight

Terraform modules create Application Insight in Azure.

## Development

```hcl-terraform

module "application_insights" {
  source = "git::https://github.com/cloudops92/terraform-azure-modules.git//terraform/application-insights"

  name              = "azure.abc.com"
  location          = "centralindia"
  application_type  = "web"
  
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