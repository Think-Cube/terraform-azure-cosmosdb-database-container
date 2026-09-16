variable "name" {
  description = "Specifies the name of the Cosmos DB SQL Container. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which the Cosmos DB SQL Container is created. Changing this forces a new resource to be created."
  type        = string
}

variable "account_name" {
  description = "The name of the Cosmos DB Account to create the container in. Changing this forces a new resource to be created."
  type        = string
}

variable "database_name" {
  description = "The name of the Cosmos DB SQL Database to create the container within. Changing this forces a new resource to be created."
  type        = string
}

variable "partition_key_paths" {
  description = "A list of partition key paths for the container."
  type        = list(string)
}

variable "partition_key_version" {
  description = "Define a partition key version. Changing this forces a new resource to be created. Possible values are 1 and 2."
  type        = number
  default     = null
  validation {
    condition     = var.partition_key_version == null || contains([1, 2], var.partition_key_version)
    error_message = "partition_key_version must be 1 or 2."
  }
}

variable "throughput" {
  description = "The throughput of the SQL container (RU/s). Must be set in increments of 100. The minimum value is 400. This must not be set when autoscale_settings is configured."
  type        = number
  default     = null
}

variable "default_ttl" {
  description = "The default time to live of Cosmos DB SQL container, in seconds. If -1, items do not expire. If absent, no items will be expired."
  type        = number
  default     = null
}

variable "analytical_storage_ttl" {
  description = "The default time to live of Analytical Storage for this SQL container. If -1, items do not expire. If absent, analytical storage is disabled."
  type        = number
  default     = null
}

variable "autoscale_settings" {
  description = "Specifies an autoscale_settings block for the SQL container."
  type = object({
    max_throughput = optional(number)
  })
  default = null
}

variable "indexing_policy" {
  description = "Specifies an indexing_policy block for the SQL container."
  type = object({
    indexing_mode = optional(string)
    included_paths = optional(list(object({
      path = string
    })), [])
    excluded_paths = optional(list(object({
      path = string
    })), [])
    composite_indexes = optional(list(list(object({
      path  = string
      order = string
    }))), [])
    spatial_indexes = optional(list(object({
      path = string
    })), [])
  })
  default = null
}

variable "unique_keys" {
  description = "A list of unique_key blocks specifying the list of unique keys on the container."
  type = list(object({
    paths = list(string)
  }))
  default = []
}

variable "conflict_resolution_policy" {
  description = "Specifies a conflict_resolution_policy block for the SQL container."
  type = object({
    mode                          = string
    conflict_resolution_path      = optional(string)
    conflict_resolution_procedure = optional(string)
  })
  default = null
}
