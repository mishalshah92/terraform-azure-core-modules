data "azurerm_logic_app_integration_account" "slack_notifier" {
  name                = var.integration_account_name
  resource_group_name = var.resource_group
}