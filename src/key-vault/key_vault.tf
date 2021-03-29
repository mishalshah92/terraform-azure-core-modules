resource "azurerm_key_vault" "key_vault" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group
  sku_name            = var.sku_name
  tenant_id           = data.azurerm_subscription.current.tenant_id

  enabled_for_deployment          = var.enabled_vm_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment
  enable_rbac_authorization       = var.enable_rbac_authorization
  purge_protection_enabled        = var.purge_protection_enabled
  soft_delete_enabled             = var.soft_delete_enabled
  soft_delete_retention_days      = var.soft_delete_retention_days

  network_acls {
    bypass                     = var.network_bypass
    default_action             = var.network_default_action
    ip_rules                   = var.network_ip_rules
    virtual_network_subnet_ids = var.virtual_network_subnet_ids
  }

  dynamic "contact" {
    for_each = var.contacts
    content {
      email = contact.value.email
      name  = lookup(contact.value, "name", null)
      phone = lookup(contact.value, "phone", null)
    }
  }

  tags = local.tags
}