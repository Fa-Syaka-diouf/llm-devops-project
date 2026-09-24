locals {
  resource_prefix = "${var.project_name}-${var.environment}"
  common_labels = {
    project     = var.project_name
    environment = var.environment
    owner       = var.owner
    managed_by  = "terraform"
  }

  # En prod, on protège davantage les données
  is_prod = var.environment == "prod"
}
