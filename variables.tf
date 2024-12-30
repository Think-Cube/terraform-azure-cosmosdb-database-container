variable "environment" {
  description = "The environment name used for backend container naming (e.g., dev, staging, prod)."
  type        = string
  default     = "dev"
}

variable "resource_group_location" {
  description = "The Azure location where the resource group is created. Changing this value forces the creation of a new resource."
  type        = string
  default     = "West Europe"
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Cosmos DB SQL container. Changing this value forces the creation of a new resource."
  type        = string
}

variable "cosmosdb_account_name" {
  description = "The name of the Cosmos DB account. Changing this value forces the creation of a new resource."
  type        = string
}

variable "cosmosdb_sql_database_name" {
  description = "The name of the Cosmos DB SQL database. Changing this value forces the creation of a new resource."
  type        = string
}

variable "cosmosdb_sql_database_container_name" {
  description = "The name of the Cosmos DB SQL container to be created."
  type        = string
}

variable "cosmosdb_sql_database_container_partition_key_paths" {
  description = "A list of partition key paths for the Cosmos DB SQL container. Partition keys are essential for scalable performance in Cosmos DB."
  type        = list(string)
  default     = ["/myPartitionKey"]
}

variable "cosmosdb_sql_database_container_partition_key_version" {
  description = "The version of the partition key for the Cosmos DB SQL container. Defaults to 1."
  type        = number
  default     = 1
}

variable "sql_database_container_paths" {
  description = "List of Cosmos DB SQL containers to create. Some parameters are inherited from the Cosmos DB account."
  type        = string
}

variable "conflict_resolution_policy" {
  description = "The conflict resolution policy for the Cosmos DB SQL container, which determines how conflicting changes are resolved."
  type = object({
    mode                           = string   # E.g., 'LastWriterWins' or 'Custom'.
    conflict_resolution_path       = string   # Path used for resolving conflicts, applicable for 'LastWriterWins' mode.
  })
  default = null
}

variable "unique_keys" {
  description = "A list of unique keys for the Cosmos DB SQL container to ensure uniqueness of specified paths."
  type = list(object({
    paths = list(string)           # Paths defining the unique key constraints.
  }))
  default = null
}

variable "indexing_policy" {
  description = "The indexing policy for the Cosmos DB SQL container, which specifies how items are indexed for queries."
  type = object({
    indexing_mode = string         # Either 'consistent' or 'none'.
    included_paths = list(object({
      path    = string             # Paths explicitly included in the index.
    }))
    excluded_paths = list(object({
      path = string                # Paths explicitly excluded from the index.
    }))
  })
  default = null
}

variable "default_ttl" {
  description = "Default time-to-live (TTL) for the Cosmos DB SQL container, specified in seconds. If null, TTL is not configured."
  type        = number
  default     = null
}
