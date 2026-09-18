# Example: Basic

Minimal working example for `terraform-azure-cosmosdb-database-container`.

```hcl
module "cosmosdb_container" {
  source = "github.com/Think-Cube/terraform-azure-cosmosdb-database-container?ref=v1.0.0"

  name                = "items"
  resource_group_name = "rg-example"
  account_name        = "cosmos-dev-example"
  database_name       = "db-example"

  partition_key_paths   = ["/id"]
  partition_key_version = 2

  throughput = 400
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