# Application Gateway

Terraform modules to create Application Gateway in Azure.

## Development

```hcl-terraform

module "application_gateway" {
  source = "git::https://github.com/cloudops92/terraform-azure-modules.git//src/application-gateway"

  name = "containerRegistry1"
  ...

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