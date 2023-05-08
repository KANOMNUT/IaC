resource "random_password" "password" {
  length = 12
  special = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azurerm_mssql_server" "mssql" {
  name = var.sql_name
  resource_group_name = var.rg
  location = var.location
  version = "12.0"
  administrator_login = var.admin_user
  administrator_login_password = random_password.password.result
  minimum_tls_version = "1.2"
  tags = var.tags
  public_network_access_enabled = "true"

  azuread_administrator {
    login_username = var.ad_admin
    object_id = var.admin_object_id
    tenant_id = var.tenant_id
  }
}

resource "azurerm_mssql_virtual_network_rule" "sql-network" {
  name = "sql-vnet-rule"
  server_id = azurerm_mssql_server.mssql.id
  subnet_id = var.sql-subnet_id
}

resource "azurerm_mssql_firewall_rule" "sql-fwrule" {
  count = length(var.firewall_rules)
  name = var.firewall_rules[count.index].name
  server_id = azurerm_mssql_server.mssql.id
  start_ip_address = var.firewall_rules[count.index].start_ip
  end_ip_address = var.firewall_rules[count.index].end_ip
}






