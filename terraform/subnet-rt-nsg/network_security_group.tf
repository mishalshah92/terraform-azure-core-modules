resource "azurerm_network_security_group" "net-sg" {
  name                = var.nsg_name == null ? "${var.name}-nsg" : var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group

  tags = local.tags
}

resource "azurerm_network_security_rule" "nsg_rules" {

  for_each = var.nsg_rules

  name                        = each.value.name
  resource_group_name         = var.resource_group
  network_security_group_name = azurerm_network_security_group.net-sg.name
  protocol                    = each.value.protocol
  priority                    = each.key
  direction                   = each.value.direction
  access                      = each.value.access
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  description                 = lookup(each.value, "description", "This rule is crated using Terraform.")

  depends_on = [
    azurerm_network_security_group.net-sg
  ]

}
