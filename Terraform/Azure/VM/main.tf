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
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

resource "random_password" "password" {
  length = 12
  special = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azurerm_virtual_machine" "vm1" {
    name = var.vm_name
    location = var.location
    resource_group_name = var.resource_group_name
    tags = var.tags
    vm_size = var.vm_size
    delete_os_disk_on_termination = true
    delete_data_disks_on_termination = true
    network_interface_ids = [azurerm_network_interface.vm_nic.id]
    
  storage_os_disk {
    name = "${var.vm_name}-osdisk"
    managed_disk_type = var.os_disk_type
    create_option     = "FromImage"
    disk_size_gb = var.os_disk_size
  }
  storage_data_disk {
    name = "${var.vm_name}-datadisk"
    lun = 0
    create_option = "Empty"
    managed_disk_type = var.data_disk_type
    disk_size_gb = var.data_disk_size
  }
  storage_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.version_os
  }
  os_profile {
    computer_name  = var.vm_name
    admin_username = "azureuser"
    admin_password = random_password.password.result
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_network_interface" "vm_nic" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name
 
  ip_configuration {
    name                          = "${var.vm_name}-ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface_security_group_association" "nic_nsg" {
  network_interface_id = azurerm_network_interface.vm_nic.id
  network_security_group_id = var.nsg_id
}

