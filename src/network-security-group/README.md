# Azure Network Security Group

Terraform modules create Network Security Group in Azure.

## Development

```hcl-terraform

module "network-security-group" {
  source = "git::https://github.com/mishah92/terraform-azure-modules.git//src/network-security-group"

  name                = "my-network-sg"
  security_rules      = [
    {
      name                                  = "test123"
      description                           = "test"
      protocol                              = "Tcp"
      source_port_ranges                    = ["*"]
      destination_port_ranges               = ["*"]
      source_address_prefixes               = ["*"]
      source_application_security_group_ids = ["*"]
      destination_address_prefixes          = ["*"]
      priority                              = 100
      direction                             = "Inbound"
      access                                = "Allow"
    }
  ]

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