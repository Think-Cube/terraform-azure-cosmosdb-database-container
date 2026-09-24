# Example: Advanced — Azure Cosmosdb Database Container

Provisions an Azure Cosmos DB SQL Container with partition key and indexing policy. Full-featured example with optional configuration blocks enabled.

## Usage

```hcl
module "cosmosdb_container" {
  source = "../.."

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
}
```