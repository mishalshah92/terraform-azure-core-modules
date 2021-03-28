output "nsg_rules" {
  value = azurerm_network_security_rule.nsg_rules
}

output "nsg_rule_ranges" {
  value = azurerm_network_security_rule.nsg_rules_ranges
}