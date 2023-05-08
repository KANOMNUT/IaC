provider "azurerm" {
  features {}
  skip_provider_registration = true
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.77.0"
    }
   azuread = {
      source = "hashicorp/azuread"
      version = "1.4.0"
    }
  }
}

resource "azurerm_key_vault_access_policy" "name" {
  key_vault_id = var.kv_id
  tenant_id = var.tenant_id
  object_id = var.object_id
  
  key_permissions = var.key_permissions
  secret_permissions = var.secret_permissions
  certificate_permissions = var.certificate_permissions
}