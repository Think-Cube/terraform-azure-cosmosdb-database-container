resource "azurerm_cosmosdb_sql_container" "main" {
  name                   = var.name
  resource_group_name    = var.resource_group_name
  account_name           = var.account_name
  database_name          = var.database_name
  partition_key_paths    = var.partition_key_paths
  partition_key_version  = var.partition_key_version
  throughput             = var.autoscale_settings == null ? var.throughput : null
  default_ttl            = var.default_ttl
  analytical_storage_ttl = var.analytical_storage_ttl

  dynamic "autoscale_settings" {
    for_each = var.autoscale_settings != null ? [var.autoscale_settings] : []
    content {
      max_throughput = autoscale_settings.value.max_throughput
    }
  }

  dynamic "indexing_policy" {
    for_each = var.indexing_policy != null ? [var.indexing_policy] : []
    content {
      indexing_mode = indexing_policy.value.indexing_mode

      dynamic "included_path" {
        for_each = indexing_policy.value.included_paths
        content {
          path = included_path.value.path
        }
      }

      dynamic "excluded_path" {
        for_each = indexing_policy.value.excluded_paths
        content {
          path = excluded_path.value.path
        }
      }

      dynamic "composite_index" {
        for_each = indexing_policy.value.composite_indexes
        content {
          dynamic "index" {
            for_each = composite_index.value
            content {
              path  = index.value.path
              order = index.value.order
            }
          }
        }
      }

      dynamic "spatial_index" {
        for_each = indexing_policy.value.spatial_indexes
        content {
          path = spatial_index.value.path
        }
      }
    }
  }

  dynamic "unique_key" {
    for_each = var.unique_keys
    content {
      paths = unique_key.value.paths
    }
  }

  dynamic "conflict_resolution_policy" {
    for_each = var.conflict_resolution_policy != null ? [var.conflict_resolution_policy] : []
    content {
      mode                          = conflict_resolution_policy.value.mode
      conflict_resolution_path      = conflict_resolution_policy.value.conflict_resolution_path
      conflict_resolution_procedure = conflict_resolution_policy.value.conflict_resolution_procedure
    }
  }
}
