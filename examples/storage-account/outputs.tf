output "storage_account_id" {
  description = "The ID of the Storage Account."
  value       = module.storage_account.storage_account_id
}

output "storage_account_primary_access_key" {
  description = "The primary access key for the Storage Account."
  value       = module.storage_account.storage_account_primary_access_key
  sensitive   = true
}

output "storage_account_secondary_access_key" {
  description = "The secondary access key for the Storage Account."
  value       = module.storage_account.storage_account_secondary_access_key
  sensitive   = true
}

