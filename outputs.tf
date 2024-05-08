output "storage_account_id" {
  description = "The ID of the Storage Account."
  value       = try(azurerm_storage_account.this[0].id, "")
}

output "storage_account_primary_access_key" {
  description = "The primary access key for the Storage Account."
  value       = try(azurerm_storage_account.this[0].primary_access_key, "")
  sensitive   = true
}

output "storage_account_secondary_access_key" {
  description = "The secondary access key for the Storage Account."
  value       = try(azurerm_storage_account.this[0].secondary_access_key, "")
  sensitive   = true
}

output "container_id" {
  description = "The ID of the container."
  value       = try(azurerm_storage_container.this[0].id, "")
}

output "sas_token" {
  description = "The computed Account Shared Access Signature (SAS)."
  value       = try(data.azurerm_storage_account_sas.this[0].sas, "")
  sensitive   = true
}
