# Azure Application Insight

Terraform modules create Application Insight in Azure.

## Development

```hcl-terraform

module "application_insights" {
  source = "git::https://github.com/mishah92/terraform-azure-modules.git//src/application-insights"

  name              = "azure.abc.com"
  location          = "centralindia"
  application_type  = "web"
  
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