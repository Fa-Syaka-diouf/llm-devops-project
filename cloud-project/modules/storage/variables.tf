variable "name" {
  type        = string
  description = "Nom du bucket (unique, 3 à 63 caractères)."

  validation {
    condition     = can(regex("^[a-z0-9][a-z0-9._-]{1,61}[a-z0-9]$", var.name))
    error_message = "Le nom du bucket doit faire 3 à 63 caractères (minuscules, chiffres, '-', '_', '.')."
  }
}

variable "location" {
  type        = string
  description = "Localisation du bucket."
  default     = "EU"
}

variable "storage_class" {
  type        = string
  description = "Classe de stockage (STANDARD, NEARLINE, COLDLINE, ARCHIVE)."
  default     = "STANDARD"
}

variable "versioning" {
  type        = bool
  description = "Active le versioning des objets."
  default     = false
}

variable "force_destroy" {
  type        = bool
  description = "Autorise la suppression du bucket même s'il contient des objets."
  default     = false
}

variable "labels" {
  type        = map(string)
  description = "Labels appliqués au bucket."
  default     = {}
}
