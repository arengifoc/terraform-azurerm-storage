## --------------------------------------------------------
## Common variables
## --------------------------------------------------------
variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "tags" {
  description = "Tags for the resource"
  type        = map(string)
  default     = {}
}

## --------------------------------------------------------
## Variables for Storage Account creation
## --------------------------------------------------------
variable "create_storage_account" {
  description = "Whether to create or not a storage account."
  type        = bool
  default     = false
}

variable "storage_account_name" {
  description = "Storage account name"
  type        = string
  default     = null
}

variable "storage_account_tier" {
  description = "Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid. Changing this forces a new resource to be created."
  type        = string
  default     = "Standard"
}

variable "storage_account_kind" {
  description = "Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2."
  type        = string
  default     = "StorageV2"
}

variable "storage_account_replication_type" {
  description = "Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS. Changing this forces a new resource to be created when types LRS, GRS and RAGRS are changed to ZRS, GZRS or RAGZRS and vice versa."
  type        = string
  default     = null
}

variable "storage_account_access_tier" {
  description = "Defines the access tier for BlobStorage, FileStorage and StorageV2 accounts. Valid options are Hot and Cool."
  type        = string
  default     = "Hot"
}

variable "storage_account_enable_https_traffic_only" {
  description = "Boolean flag which forces HTTPS if enabled, see here for more information."
  type        = bool
  default     = true
}

variable "storage_account_min_tls_version" {
  description = "The minimum supported TLS version for the storage account. Possible values are TLS1_0, TLS1_1, and TLS1_2. Defaults to TLS1_2 for new storage accounts."
  type        = string
  default     = "TLS1_0"
}

variable "storage_account_shared_access_key_enabled" {
  description = "Indicates whether the storage account permits requests to be authorized with the account access key via Shared Key. If false, then all requests, including shared access signatures, must be authorized with Azure Active Directory (Azure AD)."
  type        = bool
  default     = true
}

## --------------------------------------------------------
## Variables for Container creation
## --------------------------------------------------------
variable "create_container" {
  description = "Whether to create or not a container."
  type        = bool
  default     = false
}

variable "container_name" {
  description = "The name of the Container which should be created within the Storage Account. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "container_access_type" {
  description = "The Access Level configured for this Container. Possible values are blob, container or private."
  type        = string
  default     = "private"
}

## --------------------------------------------------------
## Variables for SAS token creation
## --------------------------------------------------------
variable "create_sas_token" {
  description = "Wheter to create a SAS token or not."
  type        = bool
  default     = false
}

variable "sas_signed_version" {
  description = "Specifies the signed storage service version to use to authorize requests made with this account SAS."
  type        = string
  default     = "2017-07-29"
}

variable "sas_resource_types" {
  description = "Llist of storage account resource types that are granted access by this SAS. Valid options are service, container and object. More than one can be specified."
  type        = list(string)
  default     = []
}

variable "sas_services" {
  description = "List of storage account services that are granted access by this SAS. Valid options are blob, queue, table and file. More than one can be specified."
  type        = list(string)
  default     = []
}

variable "sas_permissions" {
  description = "List of storage account permissions granted for this SAS. Valid options are read, write, delete, list, add, create, update, process, tag and filter. More than one can be specified."
  type        = list(string)
  default     = []
}

variable "sas_start" {
  description = "The starting time and date of validity of this SAS. Must be a valid ISO-8601 format time/date string."
  type        = string
  default     = null
}

variable "sas_expiry" {
  description = "The expiration time and date of this SAS. Must be a valid ISO-8601 format time/date string."
  type        = string
  default     = null
}

variable "sas_ip_addresses" {
  description = "IP address, or a range of IP addresses, from which to accept requests. When specifying a range, note that the range is inclusive. "
  type        = string
  default     = null
}
