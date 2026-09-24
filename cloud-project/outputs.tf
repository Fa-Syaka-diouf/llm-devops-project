output "resource_prefix" {
  description = "Préfixe commun des ressources."
  value       = local.resource_prefix
}

output "bucket_name" {
  description = "Nom du bucket Cloud Storage."
  value       = module.storage.bucket_name
}

output "bucket_url" {
  description = "URL gs:// du bucket."
  value       = module.storage.bucket_url
}

output "pubsub_topic_name" {
  description = "Nom du topic Pub/Sub."
  value       = module.pubsub.topic_name
}

output "pubsub_topic_id" {
  description = "ID complet du topic Pub/Sub."
  value       = module.pubsub.topic_id
}

output "pubsub_subscription_name" {
  description = "Nom de l'abonnement Pub/Sub."
  value       = module.pubsub.subscription_name
}
