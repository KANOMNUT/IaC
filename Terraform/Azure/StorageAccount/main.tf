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

resource "azurerm_storage_account" "kanomnutt_sa" {
  name = var.sa_name
  resource_group_name = var.resource_group_name
  location = var.location
  access_tier = var.access_tier
  account_replication_type = var.account_replication_type
  account_kind = var.account_kind
  account_tier = var.account_tier
  min_tls_version = var.tls_version
  allow_blob_public_access = var.blob_public_access
}
