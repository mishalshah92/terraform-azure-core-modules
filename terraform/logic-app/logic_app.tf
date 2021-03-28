resource "azurerm_logic_app_workflow" "logic_app" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group

  integration_service_environment_id = var.integration_service_environment_id
  logic_app_integration_account_id   = var.logic_app_integration_account_id
  workflow_schema                    = var.workflow_schema
  workflow_version                   = var.workflow_version

  parameters = var.parameters

  tags = local.tags
}