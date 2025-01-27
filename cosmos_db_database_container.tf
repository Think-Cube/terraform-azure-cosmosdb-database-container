resource "azurerm_cosmosdb_sql_container" "main" {
  name                  = var.cosmosdb_sql_database_container_name
  resource_group_name   = data.azurerm_cosmosdb_account.main.resource_group_name
  account_name          = data.azurerm_cosmosdb_account.main.name
  database_name         = var.cosmosdb_sql_database_name
  partition_key_paths   = var.cosmosdb_sql_database_container_partition_key_paths
  partition_key_version = var.cosmosdb_sql_database_container_partition_key_version
  default_ttl           = var.default_ttl != null ? var.default_ttl : null

  dynamic "unique_key" {
    for_each = var.unique_keys != null ? var.unique_keys : []
    content {
      paths = unique_key.value["paths"]
    }
  }

  dynamic "conflict_resolution_policy" {
    for_each = var.conflict_resolution_policy != null ? [var.conflict_resolution_policy] : []
    content {
      mode                          = conflict_resolution_policy.value["mode"]
      conflict_resolution_path      = conflict_resolution_policy.value["conflict_resolution_path"]
    }
  }

  dynamic "indexing_policy" {
    for_each = var.indexing_policy != null ? [var.indexing_policy] : []
    content {
      indexing_mode = indexing_policy.value["indexing_mode"]

      dynamic "included_path" {
        for_each = indexing_policy.value["included_paths"] != null ? indexing_policy.value["included_paths"] : []
        content {
          path = included_path.value["path"]
        }
      }

      dynamic "excluded_path" {
        for_each = indexing_policy.value["excluded_paths"] != null ? indexing_policy.value["excluded_paths"] : []
        content {
          path = excluded_path.value["path"]
        }
      }

    }
  }
}
