# Azure Subnet

Terraform modules create Subnet in Azure.

## Development

```hcl-terraform

module "subnet" {
  source = "git@github.com/mishah92/terraform-azure-modules.git//terraform/subnet"

  name                  = "my-route-table"
  virtual_network_name  = "my-vnet"
  address_prefixes      = [10.0.10.0/24]

  # Tags
  resource_group = "my-resourcegroup"
}

```
 
- **Variables**: For info on variables, check [file](variables.tf)
- **Outputs**: For info on outputs, check [file](outputs.tf)