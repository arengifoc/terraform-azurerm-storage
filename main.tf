## --------------------------------------------------------
## Providers
## --------------------------------------------------------
provider "azurerm" {
  features {}
}

## --------------------------------------------------------
## Data Sources
## --------------------------------------------------------
data "azurerm_resource_group" "selected" {
  name = var.resource_group_name
}

data "azurerm_storage_account" "selected" {
  count = var.create_sas_token ? 1 : 0

  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
}

data "azurerm_storage_account_sas" "this" {
  count = var.create_sas_token ? 1 : 0

  connection_string = data.azurerm_storage_account.selected[0].primary_connection_string
  https_only        = true
  signed_version    = var.sas_signed_version
  start             = var.sas_start
  expiry            = var.sas_expiry
  ip_addresses      = var.sas_ip_addresses

  resource_types {
    service   = contains(var.sas_resource_types, "service")
    container = contains(var.sas_resource_types, "container")
    object    = contains(var.sas_resource_types, "object")
  }

  services {
    blob  = contains(var.sas_services, "blob")
    queue = contains(var.sas_services, "queue")
    table = contains(var.sas_services, "table")
    file  = contains(var.sas_services, "file")
  }

  permissions {
    read    = contains(var.sas_permissions, "read")
    write   = contains(var.sas_permissions, "write")
    delete  = contains(var.sas_permissions, "delete")
    list    = contains(var.sas_permissions, "list")
    add     = contains(var.sas_permissions, "add")
    create  = contains(var.sas_permissions, "create")
    update  = contains(var.sas_permissions, "update")
    process = contains(var.sas_permissions, "process")
    tag     = contains(var.sas_permissions, "tag")
    filter  = contains(var.sas_permissions, "filter")
  }
}

## --------------------------------------------------------
## Resources
## --------------------------------------------------------
#
# Storage Account creation
#
resource "azurerm_storage_account" "this" {
  count = var.create_storage_account ? 1 : 0

  name                      = var.storage_account_name
  resource_group_name       = data.azurerm_resource_group.selected.name
  location                  = data.azurerm_resource_group.selected.location
  account_tier              = var.storage_account_tier
  account_kind              = var.storage_account_kind
  account_replication_type  = var.storage_account_replication_type
  access_tier               = var.storage_account_access_tier
  enable_https_traffic_only = var.storage_account_enable_https_traffic_only
  min_tls_version           = var.storage_account_min_tls_version
  shared_access_key_enabled = var.storage_account_shared_access_key_enabled

  tags = var.tags
}

#
# Container creation
#
resource "azurerm_storage_container" "this" {
  count = var.create_container ? 1 : 0

  name                  = var.container_name
  storage_account_name  = var.storage_account_name
  container_access_type = var.container_access_type

  depends_on = [azurerm_storage_account.this]
}
