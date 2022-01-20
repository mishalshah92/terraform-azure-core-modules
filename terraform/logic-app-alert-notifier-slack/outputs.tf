output "logic_app_id" {
  value = azurerm_logic_app_workflow.logic_app.id
}

output "logic_app_access_endpoint" {
  value = azurerm_logic_app_workflow.logic_app.access_endpoint
}

output "logic_app_connector_endpoint_ip_addresses" {
  value = azurerm_logic_app_workflow.logic_app.connector_endpoint_ip_addresses
}

output "logic_app_connector_outbound_ip_addresses" {
  value = azurerm_logic_app_workflow.logic_app.connector_outbound_ip_addresses
}

output "logic_app_workflow_endpoint_ip_addresses" {
  value = azurerm_logic_app_workflow.logic_app.workflow_endpoint_ip_addresses
}

output "logic_app_workflow_outbound_ip_addresses" {
  value = azurerm_logic_app_workflow.logic_app.workflow_outbound_ip_addresses
}

output "logic_app_workflow_schema" {
  value = azurerm_logic_app_workflow.logic_app.workflow_schema
}

output "logic_app_workflow_version" {
  value = azurerm_logic_app_workflow.logic_app.workflow_version
}

output "logic_app_http_request_id" {
  value = azurerm_logic_app_trigger_http_request.logic_app_http_request.id
}

//output "logic_app_javascript_code_processor_id" {
//  value = azurerm_logic_app_action_custom.logic_app_javascript_code_processor.id
//}

output "logic_app_action_http_slack_id" {
  value = azurerm_logic_app_action_http.logic_app_action_http_slack.id
}