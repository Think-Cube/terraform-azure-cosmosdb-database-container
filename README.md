## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 4.38.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.38.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_cosmosdb_sql_container.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.38.1/docs/resources/cosmosdb_sql_container) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/4.38.1/docs/data-sources/client_config) | data source |
| [azurerm_cosmosdb_account.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.38.1/docs/data-sources/cosmosdb_account) | data source |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/4.38.1/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_conflict_resolution_policy"></a> [conflict\_resolution\_policy](#input\_conflict\_resolution\_policy) | The conflict resolution policy for the Cosmos DB SQL container, which determines how conflicting changes are resolved. | <pre>object({<br/>    mode                           = string   # E.g., 'LastWriterWins' or 'Custom'.<br/>    conflict_resolution_path       = string   # Path used for resolving conflicts, applicable for 'LastWriterWins' mode.<br/>  })</pre> | `null` | no |
| <a name="input_cosmosdb_account_name"></a> [cosmosdb\_account\_name](#input\_cosmosdb\_account\_name) | The name of the Cosmos DB account. Changing this value forces the creation of a new resource. | `string` | n/a | yes |
| <a name="input_cosmosdb_sql_database_container_name"></a> [cosmosdb\_sql\_database\_container\_name](#input\_cosmosdb\_sql\_database\_container\_name) | The name of the Cosmos DB SQL container to be created. | `string` | n/a | yes |
| <a name="input_cosmosdb_sql_database_container_partition_key_paths"></a> [cosmosdb\_sql\_database\_container\_partition\_key\_paths](#input\_cosmosdb\_sql\_database\_container\_partition\_key\_paths) | A list of partition key paths for the Cosmos DB SQL container. Partition keys are essential for scalable performance in Cosmos DB. | `list(string)` | <pre>[<br/>  "/myPartitionKey"<br/>]</pre> | no |
| <a name="input_cosmosdb_sql_database_container_partition_key_version"></a> [cosmosdb\_sql\_database\_container\_partition\_key\_version](#input\_cosmosdb\_sql\_database\_container\_partition\_key\_version) | The version of the partition key for the Cosmos DB SQL container. Defaults to 1. | `number` | `1` | no |
| <a name="input_cosmosdb_sql_database_name"></a> [cosmosdb\_sql\_database\_name](#input\_cosmosdb\_sql\_database\_name) | The name of the Cosmos DB SQL database. Changing this value forces the creation of a new resource. | `string` | n/a | yes |
| <a name="input_default_ttl"></a> [default\_ttl](#input\_default\_ttl) | Default time-to-live (TTL) for the Cosmos DB SQL container, specified in seconds. If null, TTL is not configured. | `number` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment name used for backend container naming (e.g., dev, staging, prod). | `string` | `"dev"` | no |
| <a name="input_indexing_policy"></a> [indexing\_policy](#input\_indexing\_policy) | The indexing policy for the Cosmos DB SQL container, which specifies how items are indexed for queries. | <pre>object({<br/>    indexing_mode = string         # Either 'consistent' or 'none'.<br/>    included_paths = list(object({<br/>      path    = string             # Paths explicitly included in the index.<br/>    }))<br/>    excluded_paths = list(object({<br/>      path = string                # Paths explicitly excluded from the index.<br/>    }))<br/>  })</pre> | `null` | no |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | The Azure location where the resource group is created. Changing this value forces the creation of a new resource. | `string` | `"West Europe"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the Cosmos DB SQL container. Changing this value forces the creation of a new resource. | `string` | n/a | yes |
| <a name="input_sql_database_container_paths"></a> [sql\_database\_container\_paths](#input\_sql\_database\_container\_paths) | List of Cosmos DB SQL containers to create. Some parameters are inherited from the Cosmos DB account. | `string` | n/a | yes |
| <a name="input_unique_keys"></a> [unique\_keys](#input\_unique\_keys) | A list of unique keys for the Cosmos DB SQL container to ensure uniqueness of specified paths. | <pre>list(object({<br/>    paths = list(string)           # Paths defining the unique key constraints.<br/>  }))</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The CosmosDB Database container ID. |
