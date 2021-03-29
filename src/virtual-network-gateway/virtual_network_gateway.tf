resource "azurerm_virtual_network_gateway" "network_gateway" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group

  type     = "Vpn"
  vpn_type = var.vpn_type

  active_active = var.active_active
  enable_bgp    = var.enable_bgp
  sku           = var.sku
  generation    = var.generation

  ip_configuration {
    name                          = "${var.name}-vnet-gateway-config"
    public_ip_address_id          = azurerm_public_ip.net-gateway-ip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = var.gateway_subnet_id
  }

  vpn_client_configuration {
    address_space        = var.pts_address_spaces
    vpn_client_protocols = var.pts_vpn_client_protocols
    root_certificate {
      name             = var.pts_root_certificate_name
      public_cert_data = var.pts_root_certificate_data
    }
  }

  tags = local.tags
}
