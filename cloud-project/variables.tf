# ---------------------------------------------------------------------------
# Projet / environnement
# --------------------------------------
variable "project_name" {
  type        = string
  description = "Nom du projet, utilisé comme préfixe des ressources."

  validation {
    condition     = can(regex("^[a-z][a-z0-9-]{2,20}$", var.project_name))
    error_message = "project_name doit faire 3 à 21 caractères : minuscules, chiffres et tirets, en commençant par une lettre."
  }
}

variable "environment" {
  type        = string
  description = "Environnement de déploiement."

  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "environment doit valoir \"dev\" ou \"prod\"."
  }
}

variable "owner" {
  type        = string
  description = "Responsable des ressources (ajouté en label)."
  default     = "student"
}

# -----------------------------------------------------------------------
# Provider / Floci
# ---------------------------------------------------------------------------
variable "project_id" {
  type        = string
  description = "ID du projet GCP. Floci GCP utilise \"floci-local\" par défaut."
  default     = "floci-local"
}

variable "region" {
  type        = string
  description = "Région GCP par défaut."
  default     = "europe-west1"
}

variable "floci_endpoint" {
  type        = string
  description = "URL de l'émulateur Floci GCP (sans slash final)."
  default     = "http://localhost:4588"

  validation {
    condition     = can(regex("^https?://[^/]+$", var.floci_endpoint))
    error_message = "floci_endpoint doit être une URL du type http://host:port, sans slash final."
  }
}

variable "fake_access_token" {
  type        = string
  description = "Jeton factice envoyé à Floci (aucune authentification réelle)."
  default     = "floci-fake-token"
  sensitive   = true
}

# -----------------------------------------   ---------------------------
# Cloud Storage
# ------------------------       ------------------------------------
variable "bucket_location" {
  type        = string
  description = "Localisation du bucket (région ou multi-région)."
  default     = "EU"
}

variable "bucket_storage_class" {
  type        = string
  description = "Classe de stockage du bucket."
  default     = "STANDARD"

  validation {
    condition     = contains(["STANDARD", "NEARLINE", "COLDLINE", "ARCHIVE"], var.bucket_storage_class)
    error_message = "bucket_storage_class doit valoir STANDARD, NEARLINE, COLDLINE ou ARCHIVE."
  }
}

variable "bucket_versioning" {
  type        = bool
  description = "Active le versioning des objets du bucket."
  default     = false
}

# ---------------------------------------------------------------------------
# Pub/Sub
# -------------------------------------------------------------
variable "message_retention_duration" {
  type        = string
  description = "Durée de rétention des messages de l'abonnement (ex : \"86400s\")."
  default     = "86400s"

  validation {
    condition     = can(regex("^[0-9]+s$", var.message_retention_duration))
    error_message = "message_retention_duration doit être un nombre de secondes suivi de \"s\" (ex : \"86400s\")."
  }
}

variable "ack_deadline_seconds" {
  type        = number
  description = "Délai d'acquittement des messages, en secondes."
  default     = 20

  validation {
    condition     = var.ack_deadline_seconds >= 10 && var.ack_deadline_seconds <= 600
    error_message = "ack_deadline_seconds doit être compris entre 10 et 600."
  }
}
