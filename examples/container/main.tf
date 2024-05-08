
module "container" {
  source = "../../"

  resource_group_name   = "vault"
  create_container      = true
  storage_account_name  = "angelrengifoctestsvault"
  container_name        = "vault"
  container_access_type = "private"

  tags = {
    owner = "Angel Rengifo - arengifoc@gmail.com"
  }
}
