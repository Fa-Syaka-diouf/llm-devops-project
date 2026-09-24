# Le provider Google est redirigé vers l'émulateur Floci GCP (endpoint local)
# au lieu des API publiques de Google (https://*.googleapis.com).
provider "google" {
  project = var.project_id
  region  = var.region

  # Floci n'exige pas d'authentification : un jeton factice suffit et évite
  # que Terraform cherche des identifiants Google réels (gcloud / ADC).
  access_token = var.fake_access_token

  # Endpoints locaux : chaque service GCP utilisé pointe vers Floci.
  storage_custom_endpoint = "${var.floci_endpoint}/storage/v1/"
  pubsub_custom_endpoint  = "${var.floci_endpoint}/v1/"
}
