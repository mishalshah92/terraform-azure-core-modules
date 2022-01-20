# Azure DNS Zone Public

Terraform modules create Public DNS zone in Azure.

## Development

```hcl-terraform

module "pub_dns_zone" {
  source = "git@bitbucket.org:ownerteam/terraform-azure-modules.git//terraform/dns-zone-public"

  name     = "azure.abc.com"
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