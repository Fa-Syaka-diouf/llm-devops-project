# Service 1 : Cloud Storage; zone d'atterrissage des fichiers bruts
module "storage" {
  source = "./modules/storage"

  name          = "${local.resource_prefix}-raw-data"
  location      = var.bucket_location
  storage_class = var.bucket_storage_class
  versioning    = var.bucket_versioning || local.is_prod
  force_destroy = !local.is_prod
  labels        = local.common_labels
}

# Service 2 : Pub/Sub; bus d'événements de l'ingestion
module "pubsub" {
  source = "./modules/pubsub"

  name                       = "${local.resource_prefix}-ingestion"
  message_retention_duration = var.message_retention_duration
  ack_deadline_seconds       = var.ack_deadline_seconds
  labels                     = local.common_labels
}
