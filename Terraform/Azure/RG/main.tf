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

resource "azurerm_resource_group" "az_rg" {
  count = length(var.rg)
  name = var.rg[count.index].name
  location = var.rg[count.index].location
  tags = var.rg[count.index].tags
}
