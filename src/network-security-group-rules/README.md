# Network Security Group Rules

Terraform modules create Network Security Group Rules in Azure.

## Development

```hcl-terraform

module "vnet_nsg_rules" {
  source = "git::https://github.com/cloudops92/terraform-azure-base-modules.git//src/network-security-group-rules"

  location                    = "centralindia"
  network_security_group_name = "mytestnsg"

  nat_gateway_rules = {
    3000 = {
      name                        = "deny_ports"
      direction                   = "Inbound"
      access                      = "Deny"
      protocol                    = "*"
      source_port_ranges          = ["*"]
      destination_port_ranges     = ["0-1023"]
      source_address_prefixs      = ["*"]
      destination_address_prefixs = ["VirtualNetwork"]
      description                 = "Deny traffic on 0-1023 Ports."
    }
  }

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