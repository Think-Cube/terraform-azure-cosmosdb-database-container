# Terraform Module — Azure Cosmos DB SQL Container

Provisions an `azurerm_cosmosdb_sql_container` with configurable partition key, indexing policy, and TTL.

## Usage

```hcl
module "cosmosdb_container" {
  source = "github.com/Think-Cube/terraform-azure-cosmosdb-database-container?ref=v1.0.0"

  name                = "my-container"
  resource_group_name = "my-rg"
  account_name        = "my-cosmosdb-account"
  database_name       = "my-database"
  partition_key_paths = ["/tenantId"]

  default_ttl = -1

  indexing_policy = {
    indexing_mode = "consistent"
    included_paths = [{ path = "/*" }]
    excluded_paths = [{ path = "/\"_etag\"/?" }]
  }
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_cosmosdb_sql_container.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_sql_container) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_name"></a> [account\_name](#input\_account\_name) | The name of the Cosmos DB Account to create the container in. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_analytical_storage_ttl"></a> [analytical\_storage\_ttl](#input\_analytical\_storage\_ttl) | The default time to live of Analytical Storage for this SQL container. If -1, items do not expire. If absent, analytical storage is disabled. | `number` | `null` | no |
| <a name="input_autoscale_settings"></a> [autoscale\_settings](#input\_autoscale\_settings) | Specifies an autoscale\_settings block for the SQL container. | <pre>object({<br>    max_throughput = optional(number)<br>  })</pre> | `null` | no |
| <a name="input_conflict_resolution_policy"></a> [conflict\_resolution\_policy](#input\_conflict\_resolution\_policy) | Specifies a conflict\_resolution\_policy block for the SQL container. | <pre>object({<br>    mode                          = string<br>    conflict_resolution_path      = optional(string)<br>    conflict_resolution_procedure = optional(string)<br>  })</pre> | `null` | no |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | The name of the Cosmos DB SQL Database to create the container within. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_default_ttl"></a> [default\_ttl](#input\_default\_ttl) | The default time to live of Cosmos DB SQL container, in seconds. If -1, items do not expire. If absent, no items will be expired. | `number` | `null` | no |
| <a name="input_indexing_policy"></a> [indexing\_policy](#input\_indexing\_policy) | Specifies an indexing\_policy block for the SQL container. | <pre>object({<br>    indexing_mode = optional(string)<br>    included_paths = optional(list(object({<br>      path = string<br>    })), [])<br>    excluded_paths = optional(list(object({<br>      path = string<br>    })), [])<br>    composite_indexes = optional(list(list(object({<br>      path  = string<br>      order = string<br>    }))), [])<br>    spatial_indexes = optional(list(object({<br>      path = string<br>    })), [])<br>  })</pre> | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Specifies the name of the Cosmos DB SQL Container. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_partition_key_paths"></a> [partition\_key\_paths](#input\_partition\_key\_paths) | A list of partition key paths for the container. | `list(string)` | n/a | yes |
| <a name="input_partition_key_version"></a> [partition\_key\_version](#input\_partition\_key\_version) | Define a partition key version. Changing this forces a new resource to be created. Possible values are 1 and 2. | `number` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which the Cosmos DB SQL Container is created. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_throughput"></a> [throughput](#input\_throughput) | The throughput of the SQL container (RU/s). Must be set in increments of 100. The minimum value is 400. This must not be set when autoscale\_settings is configured. | `number` | `null` | no |
| <a name="input_unique_keys"></a> [unique\_keys](#input\_unique\_keys) | A list of unique\_key blocks specifying the list of unique keys on the container. | <pre>list(object({<br>    paths = list(string)<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The CosmosDB SQL Container ID. |
| <a name="output_name"></a> [name](#output\_name) | The CosmosDB SQL Container name. |
<!-- END_TF_DOCS -->