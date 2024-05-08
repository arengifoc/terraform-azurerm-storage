
module "storage_account" {
  source = "../../"

  resource_group_name              = "vault"
  create_storage_account           = true
  storage_account_name             = "angelrengifoctestsvault"
  storage_account_tier             = "Standard"
  storage_account_replication_type = "LRS"

  tags = {
    owner = "Angel Rengifo - arengifoc@gmail.com"
  }
}
