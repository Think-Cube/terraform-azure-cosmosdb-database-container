resource "azurerm_cosmosdb_sql_container" "main" {
  name                  = var.cosmosdb_sql_database_container_name
  resource_group_name   = data.azurerm_cosmosdb_account.main.resource_group_name
  account_name          = data.azurerm_cosmosdb_account.main.name
  database_name         = var.cosmosdb_sql_database_name
  partition_key_path    = var.cosmosdb_sql_database_container_partition_key_path
  partition_key_version = var.cosmosdb_sql_database_container_partition_key_version

  unique_key {
    paths = [var.sql_database_container_paths]
  }
}
