resource "azurerm_private_dns_zone" "private_dns_zone" {
  name                = var.name
  resource_group_name = var.resource_group

  dynamic "soa_record" {
    for_each = var.soa_record
    content {
      email         = soa_record.value.email
      host_name     = soa_record.value.host_name
      expire_time   = lookup(soa_record.value, "expire_time", null)
      minimum_ttl   = lookup(soa_record.value, "minimum_ttl", null)
      refresh_time  = lookup(soa_record.value, "refresh_time", null)
      retry_time    = lookup(soa_record.value, "retry_time", null)
      serial_number = lookup(soa_record.value, "serial_number", null)
      ttl           = lookup(soa_record.value, "ttl", null)
      tags          = local.tags
    }
  }

  tags = local.tags
}