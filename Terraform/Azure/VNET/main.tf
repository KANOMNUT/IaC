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

resource "azurerm_virtual_network" "vnet" {
  name = var.vnet_name
  address_space = var.address_space
  location = var.location
  resource_group_name = var.resource_group_name
  tags = var.tags
}

resource "azurerm_subnet" "subnet" {
  name = var.subnet_name
  address_prefixes = var.address_prefixes
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name = var.resource_group_name

}