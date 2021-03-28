resource "azurerm_network_security_rule" "nsg_rules" {

  for_each = var.nat_gateway_rules

  name                        = each.value.name
  resource_group_name         = var.resource_group
  network_security_group_name = var.network_security_group_name
  description                 = lookup(each.value, "description", null)
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  priority                    = each.key
  direction                   = each.value.direction
  access                      = each.value.access
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix

}

resource "azurerm_network_security_rule" "nsg_rules_ranges" {

  for_each = var.nat_gateway_rule_ranges

  name                         = each.value.name
  resource_group_name          = var.resource_group
  network_security_group_name  = var.network_security_group_name
  description                  = lookup(each.value, "description", null)
  protocol                     = each.value.protocol
  source_port_ranges           = each.value.source_port_ranges
  destination_port_ranges      = each.value.destination_port_ranges
  priority                     = each.key
  direction                    = each.value.direction
  access                       = each.value.access
  source_address_prefixes      = each.value.source_address_prefixes
  destination_address_prefixes = each.value.destination_address_prefixes

}