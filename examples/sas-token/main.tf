
module "sas" {
  source = "../../"

  resource_group_name  = "vault"
  storage_account_name = "angelrengifoctestsvault"
  create_sas_token     = true
  sas_start            = "2024-05-01T00:00:00Z"
  sas_expiry           = "2029-12-31T23:59:00Z"
  sas_resource_types   = ["container", "object"]
  sas_services         = ["blob"]
  sas_permissions      = ["read", "write", "delete", "list", "add", "create", "update"]

  tags = {
    owner = "Angel Rengifo - arengifoc@gmail.com"
  }
}
