variable "name" {
  type        = string
  description = "Nom du topic ; l'abonnement est nommé <name>-sub."

  validation {
    condition     = can(regex("^[a-zA-Z][a-zA-Z0-9._~%+-]{2,250}$", var.name))
    error_message = "Le nom du topic doit commencer par une lettre et faire 3 à 251 caractères."
  }
}

variable "ack_deadline_seconds" {
  type        = number
  description = "Délai d'acquittement des messages, en secondes (10 à 600)."
  default     = 20
}

variable "message_retention_duration" {
  type        = string
  description = "Durée de rétention des messages non acquittés (ex : \"86400s\")."
  default     = "604800s"
}

variable "labels" {
  type        = map(string)
  description = "Labels appliqués au topic et à l'abonnement."
  default     = {}
}
