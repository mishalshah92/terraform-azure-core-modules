# Azure Linux Virtual Machine ScaleSet

Terraform modules deploys Linux Virtual Machine ScaleSet.

## Development

```hcl-terraform

module "linux-virtual-machine-scaleset" {
  source = "git::https://github.com/cloudops92/terraform-azure-modules.git//terraform/linux-virtual-machine-scaleset"

  name     = "dynamic-demand"
  location = "eastus"

  # OS
  source_image_id = "my-vm-iamge-id"
  
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