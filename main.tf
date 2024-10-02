data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

data "azurerm_cosmosdb_account" "main" {
  name                = var.cosmosdb_account_name
  resource_group_name = data.azurerm_resource_group.rg.name
}
