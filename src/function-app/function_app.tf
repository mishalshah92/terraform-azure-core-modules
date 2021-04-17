resource "azurerm_function_app" "function" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group

  enabled                = var.enabled
  enable_builtin_logging = var.enable_builtin_logging
  https_only             = var.https_only

  os_type                 = var.os_type
  app_service_plan_id     = var.app_service_plan_id
  app_settings            = var.app_settings
  daily_memory_time_quota = var.daily_memory_time_quota
  client_affinity_enabled = var.client_affinity_enabled

  version = var.function_version

  identity {
    type         = var.identity_type
    identity_ids = var.identity_ids
  }

  auth_settings {
    enabled                        = var.auth_settings_enabled
    default_provider               = var.default_provider
    additional_login_params        = var.additional_login_params
    allowed_external_redirect_urls = var.allowed_external_redirect_urls

    dynamic "active_directory" {
      for_each = var.active_directory_settings
      content {
        client_id         = active_directory.value.client_id
        client_secret     = lookup(active_directory.value, "client_secret", null)
        allowed_audiences = lookup(active_directory.value, "allowed_audiences", null)
      }
    }

    dynamic "facebook" {
      for_each = var.facebook_auth_settings
      content {
        app_id       = facebook.value.app_id
        app_secret   = lookup(facebook.value, "app_secret", null)
        oauth_scopes = lookup(facebook.value, "oauth_scopes", null)
      }
    }

    dynamic "google" {
      for_each = var.google_auth_settings
      content {
        client_id     = google.value.client_id
        client_secret = lookup(google.value, "client_secret", null)
        oauth_scopes  = lookup(google.value, "oauth_scopes", null)
      }
    }


    dynamic "microsoft" {
      for_each = var.microsoft_auth_settings
      content {
        client_id     = microsoft.value.client_id
        client_secret = lookup(microsoft.value, "client_secret", null)
        oauth_scopes  = lookup(microsoft.value, "oauth_scopes", null)
      }
    }

    dynamic "twitter" {
      for_each = var.twitter_auth_settings
      content {
        consumer_key    = twitter.value.consumer_key
        consumer_secret = lookup(twitter.value, "consumer_secret", null)
      }
    }

    runtime_version = var.runtime_version

    unauthenticated_client_action = var.unauthenticated_client_action
    issuer                        = var.issuer
    token_refresh_extension_hours = var.token_refresh_extension_hours
    token_store_enabled           = var.token_store_enabled
  }

  dynamic "connection_string" {
    for_each = var.connection_string == null ? [] : ["true"]
    content {
      name  = var.connection_string.name
      type  = var.connection_string.type
      value = var.connection_string.value
    }
  }

  site_config {
    always_on          = var.always_on
    ftps_state         = var.ftps_state
    health_check_path  = var.health_check_path
    http2_enabled      = var.http2_enabled
    min_tls_version    = var.min_tls_version
    websockets_enabled = var.websockets_enabled

    cors {
      allowed_origins     = var.cors_allowed_origins
      support_credentials = var.cors_support_credentials
    }

    pre_warmed_instance_count = var.pre_warmed_instance_count
    linux_fx_version          = var.linux_fx_version
    use_32_bit_worker_process = var.use_32_bit_worker_process

    ip_restriction              = var.ip_restriction
    scm_ip_restriction          = var.scm_ip_restriction
    scm_type                    = var.scm_type
    scm_use_main_ip_restriction = var.scm_use_main_ip_restriction

  }

  dynamic "source_control" {
    for_each = var.repo_url == null ? [] : ["true"]
    content {
      repo_url           = var.repo_url
      branch             = var.repo_branch
      manual_integration = var.manual_integration
      rollback_enabled   = var.rollback_enabled
      use_mercurial      = var.use_mercurial
    }
  }

  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key

  tags = var.tags

}