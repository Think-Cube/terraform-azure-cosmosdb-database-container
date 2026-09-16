output "id" {
  description = "The CosmosDB SQL Container ID."
  value       = azurerm_cosmosdb_sql_container.main.id
}

output "name" {
  description = "The CosmosDB SQL Container name."
  value       = azurerm_cosmosdb_sql_container.main.name
}
