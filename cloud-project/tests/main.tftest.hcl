# Tests Terraform (terraform test) : exécutés avec un provider simulé,
# ils ne nécessitent ni Floci ni accès réseau.
mock_provider "google" {}

variables {
  project_name = "cloud-project"
  environment  = "dev"
}

run "dev_naming_and_labels" {
  command = apply

  assert {
    condition     = output.resource_prefix == "cloud-project-dev"
    error_message = "Le préfixe doit être <project_name>-<environment>."
  }

  assert {
    condition     = output.bucket_name == "cloud-project-dev-raw-data"
    error_message = "Le nom du bucket doit utiliser local.resource_prefix."
  }

  assert {
    condition     = output.pubsub_topic_name == "cloud-project-dev-ingestion"
    error_message = "Le nom du topic doit utiliser local.resource_prefix."
  }

  assert {
    condition     = output.pubsub_subscription_name == "cloud-project-dev-ingestion-sub"
    error_message = "L'abonnement doit être nommé <topic>-sub."
  }

  assert {
    condition     = module.storage.bucket_name == output.bucket_name
    error_message = "L'output racine doit exposer l'output du module storage."
  }
}

run "dev_bucket_is_disposable" {
  command = plan

  module {
    source = "./modules/storage"
  }

  variables {
    name          = "cloud-project-dev-raw-data"
    force_destroy = true
    labels        = { environment = "dev" }
  }

  assert {
    condition     = google_storage_bucket.this.force_destroy == true
    error_message = "En dev, le bucket doit pouvoir être détruit même non vide."
  }

  assert {
    condition     = google_storage_bucket.this.labels["environment"] == "dev"
    error_message = "Les labels doivent être transmis au bucket."
  }
}

run "prod_protects_data" {
  command = apply

  variables {
    environment       = "prod"
    bucket_versioning = false # doit être forcé à true en prod
  }

  assert {
    condition     = output.bucket_name == "cloud-project-prod-raw-data"
    error_message = "Le nom du bucket doit refléter l'environnement prod."
  }

  assert {
    condition     = module.storage.versioning_enabled == true
    error_message = "En prod, le versioning doit être forcé (local.is_prod)."
  }
}

run "rejects_unknown_environment" {
  command = plan

  variables {
    environment = "staging"
  }

  expect_failures = [var.environment]
}

run "rejects_invalid_ack_deadline" {
  command = plan

  variables {
    ack_deadline_seconds = 5
  }

  expect_failures = [var.ack_deadline_seconds]
}

run "rejects_invalid_storage_class" {
  command = plan

  variables {
    bucket_storage_class = "PREMIUM"
  }

  expect_failures = [var.bucket_storage_class]
}
