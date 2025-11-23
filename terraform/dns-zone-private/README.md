# Azure DNS Zone Private

Terraform modules create Private DNS zone in Azure.

## Development

```hcl-terraform

module "private_dns_zone" {
  source = "git::https://github.com/mishalshah92/terraform-azure-modules.git//terraform/dns-zone-private"

  name     = "azure.abc.com"
  # Tags
  customer       = "owner"
  env            = "learn"
  owner          = "owner"
  email          = "test@owner.ai"
  repo           = "https://github.com/mishalshah92/terraform-azure-modules"
  resource_group = "my-resourcegroup"
  deployment     = "default"
  module         = "test"
}

```
 
- **Variables**: For info on variables, check [file](variables.tf)
- **Outputs**: For info on outputs, check [file](outputs.tf)