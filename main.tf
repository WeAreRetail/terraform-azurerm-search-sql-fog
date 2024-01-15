data "azurerm_resources" "sql_server_main" {
  type = "Microsoft.Sql/servers"

  required_tags = {
    A_INFRA_REGION = var.region_main
    A_PROJECT      = var.project
    A_ENVIRONMENT  = var.environment
  }
}

data "azurerm_resources" "sql_server_fog" {
  type = "Microsoft.Sql/servers"

  required_tags = {
    A_INFRA_REGION = var.region_dr
    A_PROJECT      = var.project
    A_ENVIRONMENT  = var.environment
  }
}

locals {
  server_name_main = one(data.azurerm_resources.sql_server_main.resources[*].name)
  server_name_fog  = one(data.azurerm_resources.sql_server_fog.resources[*].name)

  server_id_main = one(data.azurerm_resources.sql_server_main.resources[*].id)
  server_id_fog  = one(data.azurerm_resources.sql_server_main.resources[*].id)

  server_rg_id_main = split("/", data.azurerm_resources.sql_server_main.resources[0].id)[4]
  server_rg_id_fog  = split("/", data.azurerm_resources.sql_server_fog.resources[0].id)[4]
}

data "azurerm_mssql_server" "sql_server_main" {
  name                = local.server_name_main
  resource_group_name = local.server_rg_id_main
}

data "azurerm_mssql_server" "sql_server_fog" {
  name                = local.server_name_fog
  resource_group_name = local.server_rg_id_fog
}

locals {
  server_fqdn_main  = data.azurerm_mssql_server.sql_server_main.fully_qualified_domain_name
  server_fqdn_fog   = data.azurerm_mssql_server.sql_server_fog.fully_qualified_domain_name
  server_fqdn_ha_rw = replace(data.azurerm_mssql_server.sql_server_main.fully_qualified_domain_name, "sql", "sqlfg")
  server_fqdn_ha_ro = replace(local.server_fqdn_ha_rw, ".database.windows.net", ".secondary.database.windows.net")
}

data "azurerm_resources" "sql_database_cat" {
  type = "Microsoft.Sql/servers/databases"

  required_tags = {
    A_INFRA_REGION = var.region_main
    A_PROJECT      = var.project
    A_ENVIRONMENT  = var.environment
  }
}

locals {
  database_name = split("/", data.azurerm_resources.sql_database_cat.resources[0].name)[1]
}

data "azurerm_mssql_database" "sql_database_cat" {
  name      = local.database_name
  server_id = local.server_id_main
}
