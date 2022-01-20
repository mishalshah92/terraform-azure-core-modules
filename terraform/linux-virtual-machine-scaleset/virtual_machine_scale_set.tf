resource "azurerm_linux_virtual_machine_scale_set" "vm_scale_set_template" {

  name                 = var.name
  computer_name_prefix = var.computer_name_prefix
  location             = var.location
  resource_group_name  = var.resource_group

  # Scaling
  instances                                         = var.number_of_instances
  sku                                               = var.vm_type
  do_not_run_extensions_on_overprovisioned_machines = var.do_not_run_extensions_on_overprovisioned_machines
  overprovision                                     = var.overprovision
  priority                                          = var.priority
  provision_vm_agent                                = var.provision_vm_agent
  proximity_placement_group_id                      = var.proximity_placement_group_id
  single_placement_group                            = var.single_placement_group
  zone_balance                                      = var.zone_balance
  zones                                             = var.zones
  scale_in_policy                                   = var.scale_in_policy

  # Networking
  dynamic "network_interface" {
    for_each = var.network_interfaces
    content {

      name = network_interface.value.name

      dynamic "ip_configuration" {
        for_each = lookup(network_interface.value, "ip_configuration", null) == null ? [] : ["true"]
        content {
          name = network_interface.value.ip_configuration.name

          application_gateway_backend_address_pool_ids = lookup(network_interface.value.ip_configuration, "application_gateway_backend_address_pool_ids", null)
          application_security_group_ids               = lookup(network_interface.value.ip_configuration, "application_security_group_ids", null)

          load_balancer_backend_address_pool_ids = lookup(network_interface.value.ip_configuration, "load_balancer_backend_address_pool_ids", null)
          load_balancer_inbound_nat_rules_ids    = lookup(network_interface.value.ip_configuration, "load_balancer_inbound_nat_rules_ids", null)

          primary   = lookup(network_interface.value.ip_configuration, "primary", false)
          subnet_id = lookup(network_interface.value.ip_configuration, "subnet_id", null)
          version   = lookup(network_interface.value.ip_configuration, "version", "IPv4")
        }
      }

      dns_servers                   = lookup(network_interface.value, "dns_servers", null)
      enable_accelerated_networking = lookup(network_interface.value, "enable_accelerated_networking", false)
      enable_ip_forwarding          = lookup(network_interface.value, "enable_ip_forwarding", false)
      primary                       = lookup(network_interface.value, "primary", false)
    }
  }

  # OS
  source_image_id                 = var.source_image_id
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = var.admin_password == null ? true : false
  custom_data                     = var.base64_encoded_custom_data

  dynamic "admin_ssh_key" {
    for_each = var.admin_ssh_keys
    content {
      username   = admin_ssh_key.value.username
      public_key = admin_ssh_key.value.public_key
    }
  }

  upgrade_mode = var.upgrade_mode

  dynamic "rolling_upgrade_policy" {
    for_each = var.rolling_upgrade_policy == null ? [] : ["true"]
    content {
      max_batch_instance_percent              = var.rolling_upgrade_policy.max_batch_instance_percent
      max_unhealthy_instance_percent          = var.rolling_upgrade_policy.max_unhealthy_instance_percent
      max_unhealthy_upgraded_instance_percent = var.rolling_upgrade_policy.max_unhealthy_upgraded_instance_percent
      pause_time_between_batches              = var.rolling_upgrade_policy.pause_time_between_batches
    }
  }

  dynamic "automatic_os_upgrade_policy" {
    for_each = var.automatic_os_upgrade_policy == null ? [] : ["true"]
    content {
      disable_automatic_rollback  = var.automatic_os_upgrade_policy.disable_automatic_rollback
      enable_automatic_os_upgrade = var.automatic_os_upgrade_policy.enable_automatic_os_upgrade
    }
  }

  dynamic "automatic_instance_repair" {
    for_each = var.automatic_instance_repair_grace_period == null ? [] : ["true"]
    content {
      enabled      = var.automatic_instance_repair_grace_period == null ? false : true
      grace_period = var.automatic_instance_repair_grace_period
    }
  }

  dynamic "boot_diagnostics" {
    for_each = var.boot_diagnostics_storage_account == null ? [] : ["true"]
    content {
      storage_account_uri = var.boot_diagnostics_storage_account
    }
  }

  terminate_notification {
    enabled = var.terminate_notification_timeout == 0 ? false : true
    timeout = var.terminate_notification_timeout == 0 ? null : var.terminate_notification_timeout
  }


  # Storage
  encryption_at_host_enabled = var.encryption_at_host_enabled
  os_disk {
    caching                   = var.caching
    storage_account_type      = var.storage_account_type
    disk_size_gb              = var.disk_size_gb
    write_accelerator_enabled = var.write_accelerator_enabled
    disk_encryption_set_id    = var.disk_encryption_set_id

    dynamic "diff_disk_settings" {
      for_each = var.diff_disk_settings_option == null ? [] : ["true"]
      content {
        option = var.diff_disk_settings_option
      }
    }
  }

  dynamic "data_disk" {
    for_each = var.data_disk
    content {
      caching                   = data_disk.value.caching
      create_option             = lookup(data_disk.value, "create_option", "Empty")
      disk_size_gb              = data_disk.value.disk_size_gb
      lun                       = data_disk.value.lun
      storage_account_type      = data_disk.value.storage_account_type
      disk_encryption_set_id    = lookup(data_disk.value, "disk_encryption_set_id", null)
      disk_iops_read_write      = lookup(data_disk.value, "disk_iops_read_write", null)
      disk_mbps_read_write      = lookup(data_disk.value, "disk_mbps_read_write", null)
      write_accelerator_enabled = lookup(data_disk.value, "write_accelerator_enabled", false)
    }
  }

  # Secret
  dynamic "secret" {
    for_each = var.secret == null ? [] : ["true"]
    content {

      dynamic "certificate" {
        for_each = var.secret.certificate
        content {
          url = certificate.value.url
        }
      }

      key_vault_id = var.secret.key_vault_id
    }
  }

  # HealthCheck
  health_probe_id = var.health_probe_id

  # Identity
  dynamic "identity" {
    for_each = var.identity_type == null ? [] : ["true"]
    content {
      type         = var.identity_type
      identity_ids = var.identity_ids
    }
  }

  # Additional
  dynamic "extension" {
    for_each = var.extensions
    content {
      name                       = extension.value.name
      publisher                  = extension.value.publisher
      type                       = extension.value.type
      type_handler_version       = extension.value.type_handler_version
      auto_upgrade_minor_version = lookup(extension.value, "auto_upgrade_minor_version", null)
      force_update_tag           = lookup(extension.value, "force_update_tag", null)
      protected_settings         = lookup(extension.value, "protected_settings", null)
      provision_after_extensions = lookup(extension.value, "provision_after_extensions", null)
      settings                   = lookup(extension.value, "settings", null)
    }
  }

  additional_capabilities {
    ultra_ssd_enabled = var.ultra_ssd_enabled
  }

  tags = local.tags

  lifecycle {
    ignore_changes = [
      instances
    ]
  }

}
