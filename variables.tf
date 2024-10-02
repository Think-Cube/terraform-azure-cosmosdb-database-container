############################
# Common vars
############################
variable "environment" {
  description = "Variable used for backend container name key."
  type        = string
  default     = "dev"
}

############################
# Resource group vars
############################
variable "resource_group_location" {
  description = "Specifies the supported Azure location where the resource group exists. Changing this forces a new resource to be created."
  default     = "West Europe"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create resources. Changing this forces a new resource to be created."
  type        = string
}

############################
# CosmosDB variables
############################
variable "cosmosdb_account_name" {
  description = "Specifies the name of the Cosmos DB account. Changing this forces a new resource to be created."
  type        = string
}

variable "cosmosdb_sql_database_name" {
  description = "Specifies the name of the Cosmos DB SQL database. Changing this forces a new resource to be created."
  type        = string
}

variable "cosmosdb_sql_database_container_name" {
  description = "Specifies the name of the Cosmos DB SQL container. Changing this forces a new resource to be created."
  type        = string
}

variable "cosmosdb_sql_database_container_partition_key_path" {
  description = "Defines the partition key path for the container. Changing this forces a new resource to be created."
  type        = string
}

variable "cosmosdb_sql_database_container_partition_key_version" {
  description = "Defines the partition key version. Changing this forces a new resource to be created. Possible values are 1 and 2. This should be set to 2 in order to use large partition keys."
  type        = number
  default     = 1
}

variable "sql_database_container_paths" {
  description = "List of Cosmos DB SQL container paths to create. Some parameters are inherited from the Cosmos account."
  type        = list(string)  # Changed to list to reflect multiple paths
}
