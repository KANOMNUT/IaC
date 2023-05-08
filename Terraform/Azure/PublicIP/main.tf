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

resource "azurerm_public_ip" "kanomnutt_pub" {
    name = var.name
    location = var.location
    resource_group_name = var.resource_group_name
    allocation_method = var.allocation_method
    tags = var.tag
    sku = var.sku
    ip_version = var.ip_version
}