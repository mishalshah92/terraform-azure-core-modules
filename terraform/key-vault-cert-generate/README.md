# Azure Key-Vault Cert Generate

Terraform modules create SSL cert in key-vault.

## Development

```hcl-terraform

module "key_vault_generate" {
  source = "git::https://github.com/mishalshah92/terraform-azure-modules.git//terraform/key-vault-cert-generate"

  name          = "containerRegistry1"
  location      = "centralindia"

  keyvault_name = "smaya-dev"
  issuer_parameters_name = "Self"

  exportable = true
  key_size = 2048
  key_type = "RSA"
  reuse_key = true

  action_type = "AutoRenew"
  days_before_expiry = 30
  lifetime_percentage = 80

  secret_content_type = "application/x-pkcs12"

  extended_key_usage = [
    "1.3.6.1.5.5.7.3.1"
  ]
  key_usage = [
    "digitalSignature",
    "keyEncipherment",
  ]

  subject = "CN=test.com"
  validity_in_months = 12
  subject_alternative_dns_names = [
    "owner.test.com"
  ]
  

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