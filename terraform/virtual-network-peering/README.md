# Azure Virtual Network Peering

Terraform modules create peering between Virtual Networks in Azure.

## Development

```hcl-terraform

module "virtual-network-peering" {
  source = "git@bitbucket.org:ownerteam/terraform-azure-modules.git//terraform/virtual-network-peering"

  name                 = "my-vnet-peering"
  resource_group_name  = "my-resource-group"
  virtual_network_name = "my-vnet"

  remote_resource_group_name  = "my-remote-rg"
  remote_virtual_network_name = "my-remote-vnet"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
}

```
 
- **Variables**: For info on variables, check [file](variables.tf)
- **Outputs**: For info on outputs, check [file](outputs.tf)