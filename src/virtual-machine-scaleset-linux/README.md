# Linux Virtual Machine ScaleSet

Terraform modules deploys Linux Virtual Machine ScaleSet.

## Development

```hcl-terraform

module "linux-virtual-machine-scaleset" {
  source = "git::https://github.com/cloudops92/terraform-azure-base-modules.git//src/linux-virtual-machine-scaleset"

  name     = "dynamic-demand"
  location = "eastus"

  # OS
  source_image_id = "my-vm-iamge-id"
  
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