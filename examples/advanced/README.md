# Example: Advanced

Full-featured example for `terraform-azure-cosmosdb-database-container`.

```hcl
module "cosmosdb_container" {
  source = "github.com/Think-Cube/terraform-azure-cosmosdb-database-container?ref=v1.0.0"

  name                   = "orders"
  resource_group_name    = "rg-example"
  account_name           = "cosmos-prod-example"
  database_name          = "db-example"
  partition_key_paths    = ["/customerId"]
  partition_key_version  = 2
  default_ttl            = 2592000
  analytical_storage_ttl = -1

  autoscale_settings = {
    max_throughput = 4000
  }

  indexing_policy = {
    indexing_mode = "consistent"
    included_paths = [
      { path = "/*" }
    ]
    excluded_paths = [
      { path = "/_etag/?" }
    ]
    composite_indexes = [
      [
        { path = "/customerId", order = "ascending" },
        { path = "/orderDate",  order = "descending" }
      ]
    ]
  }

  unique_keys = [
    { paths = ["/orderId"] }
  ]

  conflict_resolution_policy = {
    mode                     = "LastWriterWins"
    conflict_resolution_path = "/_ts"
  }
}```` 

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cosmosdb_container"></a> [cosmosdb\_container](#module\_cosmosdb\_container) | github.com/Think-Cube/terraform-azure-cosmosdb-database-container | v1.0.0 |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->