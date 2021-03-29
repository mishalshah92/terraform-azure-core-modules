# Azure Linux Virtual Machine ScaleSet

Terraform modules deploys Linux Virtual Machine ScaleSet.

## Development

```hcl-terraform

module "linux-virtual-machine-scaleset" {
  source = "git::https://github.com/mishah92/terraform-azure-modules.git//src/linux-virtual-machine-scaleset"

  name     = "dynamic-demand"
  location = "eastus"

  # OS
  source_image_id = "my-vm-iamge-id"
  
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