module "cosmosdb_container" {
  source = "../.."

  name                = "items"
  resource_group_name = "rg-example"
  account_name        = "cosmos-dev-example"
  database_name       = "db-example"

  partition_key_paths   = ["/id"]
  partition_key_version = 2

  throughput = 400
}