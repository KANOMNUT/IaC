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

resource "azurerm_postgresql_server" "pg_server" {
  name = var.pg_name
  location = var.location
  resource_group_name = var.rg
  tags = var.tag
  auto_grow_enabled = false
  
  administrator_login = var.pg_admin_user
  administrator_login_password = random_password.password.result

  sku_name = var.sku
  version = var.version_pg
  storage_mb = var.storage_mb

  ssl_enforcement_enabled = var.ssl_enforcement_enabled
  ssl_minimal_tls_version_enforced = var.ssl_minimal_tls_version_enforced
  public_network_access_enabled = true

}

resource "azurerm_postgresql_active_directory_administrator" "pg_ad_admin" {
  server_name = azurerm_postgresql_server.pg_server.name
  resource_group_name = var.rg
  login = "thanachai.tre@gmail.com"
  object_id = "0893967e-b89b-4c6d-a29c-59f2c2572f03"
  tenant_id = "d29f5fe5-0b00-496d-bd52-a5993a1a6cf2"
}

resource "azurerm_postgresql_firewall_rule" "pg_fw_rule" {
  count = length(var.firewall_rules)
  resource_group_name = var.rg
  server_name = var.pg_name
  name = var.firewall_rules[count.index].name
  start_ip_address = var.firewall_rules[count.index].start_ip
  end_ip_address = var.firewall_rules[count.index].end_ip
  depends_on = [
     azurerm_postgresql_server.pg_server
   ]
}

# resource "azurerm_postgresql_firewall_rule" "pg_fw_rule1" {
#   name = "pg_fw_rule_01"
#   resource_group_name = var.rg
#   server_name = var.pg_name
#   start_ip_address = "192.168.1.10"
#   end_ip_address = "192.168.1.10"
#   depends_on = [
#     azurerm_postgresql_server.pg
#   ]
# }

# resource "azurerm_postgresql_firewall_rule" "pg_fw_rule2" {
#   name = "pg_fw_rule_02"
#   resource_group_name = var.rg
#   server_name = var.pg_name
#   start_ip_address = "192.168.1.100"
#   end_ip_address = "192.168.1.100"
#   depends_on = [
#     azurerm_postgresql_server.pg
#   ]
# }
