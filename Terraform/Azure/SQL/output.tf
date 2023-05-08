output "sql_server_admin_password" {
  value = module.sql_server.sql_server_admin_password
  sensitive = true
}
output "sql_server_admin_login" {
  value = module.sql_server.administrator_login
}
output "sql_server_name" {
  value = module.sql_server.server_name
}