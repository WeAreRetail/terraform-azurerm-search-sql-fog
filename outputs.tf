output "server_main_id" {
  value = one(data.azurerm_resources.sql_server_main.resources[*].id)
}

output "server_fog_id" {
  value = one(data.azurerm_resources.sql_server_fog.resources[*].id)
}

output "mssql_database" {
  value = local.database_name
}

output "mssql_server_fqdn" {
  value = local.server_fqdn_ha_rw
}

output "mssql_server_fqdn_ro" {
  value = local.server_fqdn_ha_ro
}
