# Example: Terraform Module — Azure Cosmos DB SQL Container

Provisions an `azurerm_cosmosdb_sql_container` with configurable partition key, indexing policy, and TTL.

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