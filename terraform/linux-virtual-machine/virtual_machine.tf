resource "azurerm_network_interface" "linux_machine_nat_interface" {
  name                = "${var.name}-nic"
  location            = var.location
  resource_group_name = var.resource_group

  enable_ip_forwarding          = var.enable_ip_forwarding
  enable_accelerated_networking = var.enable_accelerated_networking
  internal_dns_name_label       = var.name

  ip_configuration {
    name                          = "internal"
    private_ip_address_allocation = var.private_ip_address_allocation
    private_ip_address_version    = var.private_ip_address_version
    private_ip_address            = var.private_ip_address_allocation == "Dynamic" ? null : var.private_ip_address
    subnet_id                     = var.subnet_id
    public_ip_address_id          = var.public_ip_address_id
    primary                       = var.primary_ip_config
  }

  tags = local.tags
}


resource "azurerm_linux_virtual_machine" "linux_machine" {
  name                = var.name
  resource_group_name = var.resource_group
  location            = var.location

  # Config
  size                         = var.size
  priority                     = var.priority
  virtual_machine_scale_set_id = var.virtual_machine_scale_set_id
  proximity_placement_group_id = var.proximity_placement_group_id
  custom_data                  = var.base64_custom_data


  # Identity
  admin_username                  = var.admin_username
  disable_password_authentication = true

  dynamic "identity" {
    for_each = var.identity_type == null ? [] : ["true"]
    content {
      type         = var.identity_type
      identity_ids = var.identity_ids
    }
  }

  dynamic "admin_ssh_key" {
    for_each = var.admin_ssh_keys
    content {
      username   = admin_ssh_key.value.username
      public_key = admin_ssh_key.value.public_key
    }
  }


  # Storage
  encryption_at_host_enabled = var.encryption_at_host_enabled
  os_disk {
    name                      = "${var.name}-root"
    caching                   = var.caching
    storage_account_type      = var.storage_account_type
    disk_size_gb              = var.disk_size_gb
    write_accelerator_enabled = var.write_accelerator_enabled
    disk_encryption_set_id    = var.disk_encryption_set_id
  }


  # Network
  zone = var.zone
  network_interface_ids = [
    azurerm_network_interface.linux_machine_nat_interface.id,
  ]


  # Source Image
  source_image_id = var.source_image_id

  dynamic "source_image_reference" {
    for_each = var.source_image_reference
    content {
      publisher = source_image_reference.value.source_image_publisher
      offer     = source_image_reference.value.source_image_offer
      sku       = source_image_reference.value.source_image_sku
      version   = source_image_reference.value.source_image_version
    }
  }

  # Secret
  dynamic "secret" {
    for_each = var.secret
    content {
      certificate {
        url = secret.value.certificate_url
      }
      key_vault_id = secret.value.key_vault_id
    }
  }

  # Others
  tags = local.tags
}


resource "azurerm_dev_test_global_vm_shutdown_schedule" "auto_shutdown" {
  virtual_machine_id = azurerm_linux_virtual_machine.linux_machine.id
  location           = var.location
  enabled            = var.auto_shutdown_enabled

  daily_recurrence_time = var.auto_shutdown_time
  timezone              = var.auto_shutdown_timezone

  notification_settings {
    enabled = false
  }

  tags = local.tags
}