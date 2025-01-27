output "id" {
  description = "The CosmosDB Database container ID."
  value       = azurerm_cosmosdb_sql_container.main.id
  sensitive   = false
}
