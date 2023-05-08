output "administrator_login" {
  value = azurerm_mssql_server.mssql.administrator_login
}
output "sql_server_admin_password" {
  value = azurerm_mssql_server.mssql.administrator_login_password
  sensitive = true
}
output "server_name" {
  value = azurerm_mssql_server.mssql.name
}