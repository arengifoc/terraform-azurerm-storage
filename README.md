# terraform-azurerm-resource-group
Terraform module for provisioning Resource Groups in Azure

<!-- BEGIN_TF_DOCS -->
## Resource Group Terraform module

This module allows creating different Storage resources, such as Storage Accounts, Containers and SAS tokens.

| Name                                         | Description                      |
| -------------------------------------------- | -------------------------------- |
| [storage-account](examples/storage-account/) | Storage Account creation example |
| [container](examples/container/)             | Container creation example       |
| [sas-token](examples/sas-token/)             | SAS token creation example       |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.0.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_storage_account.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_container.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |
| [azurerm_resource_group.selected](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_storage_account.selected](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_account) | data source |
| [azurerm_storage_account_sas.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_account_sas) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_container_access_type"></a> [container\_access\_type](#input\_container\_access\_type) | The Access Level configured for this Container. Possible values are blob, container or private. | `string` | `"private"` | no |
| <a name="input_container_name"></a> [container\_name](#input\_container\_name) | The name of the Container which should be created within the Storage Account. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_create_container"></a> [create\_container](#input\_create\_container) | Whether to create or not a container. | `bool` | `false` | no |
| <a name="input_create_sas_token"></a> [create\_sas\_token](#input\_create\_sas\_token) | Wheter to create a SAS token or not. | `bool` | `false` | no |
| <a name="input_create_storage_account"></a> [create\_storage\_account](#input\_create\_storage\_account) | Whether to create or not a storage account. | `bool` | `false` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `string` | n/a | yes |
| <a name="input_sas_expiry"></a> [sas\_expiry](#input\_sas\_expiry) | The expiration time and date of this SAS. Must be a valid ISO-8601 format time/date string. | `string` | `null` | no |
| <a name="input_sas_ip_addresses"></a> [sas\_ip\_addresses](#input\_sas\_ip\_addresses) | IP address, or a range of IP addresses, from which to accept requests. When specifying a range, note that the range is inclusive. | `string` | `null` | no |
| <a name="input_sas_permissions"></a> [sas\_permissions](#input\_sas\_permissions) | List of storage account permissions granted for this SAS. Valid options are read, write, delete, list, add, create, update, process, tag and filter. More than one can be specified. | `list(string)` | `[]` | no |
| <a name="input_sas_resource_types"></a> [sas\_resource\_types](#input\_sas\_resource\_types) | Llist of storage account resource types that are granted access by this SAS. Valid options are service, container and object. More than one can be specified. | `list(string)` | `[]` | no |
| <a name="input_sas_services"></a> [sas\_services](#input\_sas\_services) | List of storage account services that are granted access by this SAS. Valid options are blob, queue, table and file. More than one can be specified. | `list(string)` | `[]` | no |
| <a name="input_sas_signed_version"></a> [sas\_signed\_version](#input\_sas\_signed\_version) | Specifies the signed storage service version to use to authorize requests made with this account SAS. | `string` | `"2017-07-29"` | no |
| <a name="input_sas_start"></a> [sas\_start](#input\_sas\_start) | The starting time and date of validity of this SAS. Must be a valid ISO-8601 format time/date string. | `string` | `null` | no |
| <a name="input_storage_account_access_tier"></a> [storage\_account\_access\_tier](#input\_storage\_account\_access\_tier) | Defines the access tier for BlobStorage, FileStorage and StorageV2 accounts. Valid options are Hot and Cool. | `string` | `"Hot"` | no |
| <a name="input_storage_account_enable_https_traffic_only"></a> [storage\_account\_enable\_https\_traffic\_only](#input\_storage\_account\_enable\_https\_traffic\_only) | Boolean flag which forces HTTPS if enabled, see here for more information. | `bool` | `true` | no |
| <a name="input_storage_account_kind"></a> [storage\_account\_kind](#input\_storage\_account\_kind) | Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. | `string` | `"StorageV2"` | no |
| <a name="input_storage_account_min_tls_version"></a> [storage\_account\_min\_tls\_version](#input\_storage\_account\_min\_tls\_version) | The minimum supported TLS version for the storage account. Possible values are TLS1\_0, TLS1\_1, and TLS1\_2. Defaults to TLS1\_2 for new storage accounts. | `string` | `"TLS1_0"` | no |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | Storage account name | `string` | `null` | no |
| <a name="input_storage_account_replication_type"></a> [storage\_account\_replication\_type](#input\_storage\_account\_replication\_type) | Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS. Changing this forces a new resource to be created when types LRS, GRS and RAGRS are changed to ZRS, GZRS or RAGZRS and vice versa. | `string` | `null` | no |
| <a name="input_storage_account_shared_access_key_enabled"></a> [storage\_account\_shared\_access\_key\_enabled](#input\_storage\_account\_shared\_access\_key\_enabled) | Indicates whether the storage account permits requests to be authorized with the account access key via Shared Key. If false, then all requests, including shared access signatures, must be authorized with Azure Active Directory (Azure AD). | `bool` | `true` | no |
| <a name="input_storage_account_tier"></a> [storage\_account\_tier](#input\_storage\_account\_tier) | Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid. Changing this forces a new resource to be created. | `string` | `"Standard"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for the resource | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_container_id"></a> [container\_id](#output\_container\_id) | The ID of the container. |
| <a name="output_container_name"></a> [container\_name](#output\_container\_name) | The name of the container. |
| <a name="output_sas_token"></a> [sas\_token](#output\_sas\_token) | The computed Account Shared Access Signature (SAS). |
| <a name="output_storage_account_id"></a> [storage\_account\_id](#output\_storage\_account\_id) | The ID of the Storage Account. |
| <a name="output_storage_account_name"></a> [storage\_account\_name](#output\_storage\_account\_name) | The name of the Storage Account. |
| <a name="output_storage_account_primary_access_key"></a> [storage\_account\_primary\_access\_key](#output\_storage\_account\_primary\_access\_key) | The primary access key for the Storage Account. |
| <a name="output_storage_account_secondary_access_key"></a> [storage\_account\_secondary\_access\_key](#output\_storage\_account\_secondary\_access\_key) | The secondary access key for the Storage Account. |
<!-- END_TF_DOCS -->