# DNS Zone Public

Terraform modules create Public DNS zone in Azure.

## Development

```hcl-terraform

module "pub_dns_zone" {
  source = "git::https://github.com/cloudops92/terraform-azure-modules.git//dns-zone-public"

  name     = "azure.abc.com"
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