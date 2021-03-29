# Azure DNS Zone Private

Terraform modules create Private DNS zone in Azure.

## Development

```hcl-terraform

module "private_dns_zone" {
  source = "git::https://github.com/mishah92/terraform-azure-modules.git//src/dns-zone-private"

  name     = "azure.abc.com"
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