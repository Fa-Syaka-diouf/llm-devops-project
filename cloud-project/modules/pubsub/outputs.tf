output "topic_name" {
  description = "Nom du topic."
  value       = google_pubsub_topic.this.name
}

output "topic_id" {
  description = "ID complet du topic (projects/<id>/topics/<name>)."
  value       = google_pubsub_topic.this.id
}

output "subscription_name" {
  description = "Nom de l'abonnement."
  value       = google_pubsub_subscription.this.name
}
