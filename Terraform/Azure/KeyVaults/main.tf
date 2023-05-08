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

output "kv_id" {
  value = azurerm_key_vault.name.id
}

resource "azurerm_key_vault" "name" {
  name = var.name
  location = var.location
  tenant_id = var.tenant_id
  resource_group_name = var.rg
  sku_name = "standard"
  purge_protection_enabled = false

}