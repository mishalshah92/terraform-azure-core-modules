# Azure Linux Virtual Machine

Terraform modules create Linux VM in Azure.

## Development

```hcl-terraform

module "linux_vm" {
  source = "git::https://github.com/mishah92/terraform-azure-modules.git//terraform/linux-virtual-machine"

  name     = "my-vnet-peering"
  location = "eastus"

  # Source Image
  source_image_publisher = "Canonical"
  source_image_offer     = "UbuntuServer"
  source_image_sku       = "16.04-LTS"
  source_image_version   = "latest"
  
  # Identity
  admin_username   = "azureuser"
  admin_ssh_keys = [
    {
      username    = "azureuser"
      public_key  = "asdasdasd"
    } 
  ]

  # Config
  size                         = "Standard_F2"
  virtual_machine_scale_set_id = null
  proximity_placement_group_id = null
  base64_custom_data           = null
  priority                     = "Regular"

  # Network
  subnet_id                     = "subnet-id-example"
  enable_ip_forwarding          = false
  enable_accelerated_networking = false
  public_ip_address_id          = null
  private_ip_address_version    = "IPv4"
  private_ip_address_allocation = "Dynamic"
  primary_ip_config             = false
  zone                          = null

  # Storage
  caching                   = "ReadWrite"
  storage_account_type      = "Standard_LRS"
  disk_size_gb              = 30
  write_accelerator_enabled = false
  disk_encryption_set_id    = null
  
  # Auto Shutdown
  auto_shutdown_enabled  = true
  auto_shutdown_time     = "2000"
  auto_shutdown_timezone = "UTC"

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