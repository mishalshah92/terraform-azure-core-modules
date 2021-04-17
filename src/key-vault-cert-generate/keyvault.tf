resource "azurerm_key_vault_certificate" "key_vault_certificate" {
  name         = var.name
  key_vault_id = data.azurerm_key_vault.keyvault.id

  certificate_policy {
    issuer_parameters {
      name = var.issuer_parameters_name
    }

    key_properties {
      exportable = var.exportable
      key_size   = var.key_size
      key_type   = var.key_type
      reuse_key  = var.reuse_key
    }

    lifetime_action {
      action {
        action_type = var.action_type
      }

      trigger {
        days_before_expiry  = var.days_before_expiry
        lifetime_percentage = var.days_before_expiry == null ? var.lifetime_percentage : null
      }
    }

    secret_properties {
      content_type = var.secret_content_type
    }

    x509_certificate_properties {
      # Server Authentication = 1.3.6.1.5.5.7.3.1
      # Client Authentication = 1.3.6.1.5.5.7.3.2
      extended_key_usage = var.extended_key_usage

      key_usage = var.key_usage

      subject_alternative_names {
        dns_names = var.subject_alternative_dns_names
        emails    = var.subject_alternative_emails
        upns      = var.subject_alternative_upns
      }

      subject            = var.subject
      validity_in_months = var.validity_in_months
    }
  }

  tags = var.tags

  lifecycle {
    create_before_destroy = false
  }
}