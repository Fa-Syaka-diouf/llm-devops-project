# Module `storage` — Cloud Storage

Crée un bucket **Google Cloud Storage** servant de zone d'atterrissage des fichiers bruts.

- accès uniforme au niveau du bucket (`uniform_bucket_level_access`) ;
- versioning et `force_destroy` paramétrables (le module racine les pilote selon l'environnement) ;
- labels transmis par l'appelant.

## Exemple

```hcl
module "storage" {
  source = "./modules/storage"

  name          = "cloud-project-dev-raw-data"
  location      = "EU"
  storage_class = "STANDARD"
  versioning    = false
  force_destroy = true
  labels        = { environment = "dev" }
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| google | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_storage_bucket.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Nom du bucket (unique, 3 à 63 caractères). | `string` | n/a | yes |
| force\_destroy | Autorise la suppression du bucket même s'il contient des objets. | `bool` | `false` | no |
| labels | Labels appliqués au bucket. | `map(string)` | `{}` | no |
| location | Localisation du bucket. | `string` | `"EU"` | no |
| storage\_class | Classe de stockage (STANDARD, NEARLINE, COLDLINE, ARCHIVE). | `string` | `"STANDARD"` | no |
| versioning | Active le versioning des objets. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| bucket\_name | Nom du bucket. |
| bucket\_self\_link | Self link du bucket. |
| bucket\_url | URL gs:// du bucket. |
| versioning\_enabled | Indique si le versioning est activé. |
<!-- END_TF_DOCS -->
