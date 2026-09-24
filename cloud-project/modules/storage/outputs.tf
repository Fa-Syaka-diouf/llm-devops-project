output "bucket_name" {
  description = "Nom du bucket."
  value       = google_storage_bucket.this.name
}

output "bucket_url" {
  description = "URL gs:// du bucket."
  value       = google_storage_bucket.this.url
}

output "versioning_enabled" {
  description = "Indique si le versioning est activé."
  value       = google_storage_bucket.this.versioning[0].enabled
}

output "bucket_self_link" {
  description = "Self link du bucket."
  value       = google_storage_bucket.this.self_link
}
