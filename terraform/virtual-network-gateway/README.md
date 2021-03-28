# Azure Virtual Network Gateway

Terraform modules create Virtual Network Gateway of VPN type in Azure.

## Development

```hcl-terraform

module "vnet_gateway" {
  source = "git@github.com/mishah92/terraform-azure-modules.git//terraform/virtual-network-gateway"

  name                = "my-route-table"
  resource_group_name = "my-resource-group"
  location            = "centralindia"

  vpn_type          = "RouteBased"
  gateway_subnet_id = "my-subnet-id"
  active_active     = false
  enable_bgp        = false
  sku               = "VpnGw1"
  generation        = "Generation1"

  pts_address_space = "172.16.0.0/24"
  pts_vpn_client_protocols = [
    "OpenVPN",
    "IkeV2"
  ]
  pts_root_certificate = {
    name             = "pts-coonection"
    public_cert_data = <<EOF
asasdasdasdasd
asdasd
EOF
  }

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