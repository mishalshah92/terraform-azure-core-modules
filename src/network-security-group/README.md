# Network Security Group

Terraform modules create Network Security Group in Azure.

## Development

```hcl-terraform

module "network-security-group" {
  source = "git::https://github.com/cloudops92/terraform-azure-modules.git//src/network-security-group"

  name                = "my-network-sg"

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