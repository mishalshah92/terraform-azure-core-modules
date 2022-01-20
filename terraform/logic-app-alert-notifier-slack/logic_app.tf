resource "azurerm_logic_app_workflow" "logic_app" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group

  logic_app_integration_account_id = data.azurerm_logic_app_integration_account.slack_notifier.id

  tags = local.tags
}

resource "azurerm_logic_app_trigger_http_request" "logic_app_http_request" {
  name         = "input-alert-common-schema"
  logic_app_id = azurerm_logic_app_workflow.logic_app.id
  method       = "POST"
  schema       = var.http_request_schema

}

//resource "azurerm_logic_app_action_custom" "logic_app_javascript_code_processor" {
//  name         = "execute-alert-processor"
//  logic_app_id = azurerm_logic_app_workflow.logic_app.id
//
//  body = <<BODY
//{
//    "inputs": {
//        "code": "var text;"
//    },
//    "type": "JavaScriptCode",
//    "runAfter": {}
//}
//BODY
//
//  depends_on = [
//    azurerm_logic_app_integration_account.integration_account,
//    azurerm_logic_app_workflow.logic_app,
//    azurerm_logic_app_trigger_http_request.logic_app_http_request
//  ]
//
//}

resource "azurerm_logic_app_action_http" "logic_app_action_http_slack" {
  name         = "slack-push"
  logic_app_id = azurerm_logic_app_workflow.logic_app.id
  method       = "POST"
  uri          = var.slack_webhook_uri
  headers = {
    "content-type" = "application/json",
    "json"         = "true"
  }
  lifecycle {
    ignore_changes = [
      body,
      run_after
    ]
  }
}