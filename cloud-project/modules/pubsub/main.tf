resource "google_pubsub_topic" "this" {
  name   = var.name
  labels = var.labels
}

resource "google_pubsub_subscription" "this" {
  name   = "${var.name}-sub"
  topic  = google_pubsub_topic.this.id
  labels = var.labels

  ack_deadline_seconds       = var.ack_deadline_seconds
  message_retention_duration = var.message_retention_duration
}
