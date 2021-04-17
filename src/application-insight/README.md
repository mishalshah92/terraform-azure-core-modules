# Application Insight

Terraform modules create Application Insight in Azure.

## Development

```hcl-terraform

module "application_insight" {
  source = "git::https://github.com/cloudops92/terraform-azure-base-modules.git//src/application-insight"

  name              = "azure.abc.com"
  application_type  = "web"
  
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