output "sas_token" {
  description = "The computed Account Shared Access Signature (SAS)."
  value       = module.sas.sas_token
  sensitive   = true
}
