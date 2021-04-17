resource "azurerm_virtual_network" "vnet" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group
  address_space       = var.address_spaces
  dns_servers         = var.dns_servers

  dynamic "ddos_protection_plan" {
    for_each = var.enable_ddos ? ["1"] : []
    content {
      id     = azurerm_network_ddos_protection_plan.vnet-ddos-plan[0].id
      enable = var.enable_ddos
    }
  }

  dynamic "subnet" {
    for_each = length(var.subnets) > 0 ? var.subnets : []
    content {
      name           = subnet.value["name"]
      address_prefix = subnet.value["address_prefix"]
      security_group = subnet.value["security_group"]
    }
  }

  tags = var.tags
}

resource "azurerm_network_ddos_protection_plan" "vnet-ddos-plan" {

  count = var.enable_ddos ? 1 : 0

  name                = "${var.name}-ddos-plan"
  location            = var.location
  resource_group_name = var.resource_group
}
