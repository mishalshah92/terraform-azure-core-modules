# Route Table

Terraform modules create Route Table in Azure.

## Development

```hcl-terraform

module "route-table" {
  source = "git::https://github.com/cloudops92/terraform-azure-modules.git//route-table"

  name                = "my-route-table"
  
  routes = [
    {
      name           = "route1"
      address_prefix = "10.1.0.0/16"
      next_hop_type  = "vnetlocal"
    }
  ]

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