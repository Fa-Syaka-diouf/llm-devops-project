# Module `pubsub` — Pub/Sub

Crée un **topic Pub/Sub** et un **abonnement pull** (`<name>-sub`) rattaché à ce topic.
Le topic sert de bus d'événements pour l'ingestion ; l'abonnement permet à un consommateur en aval de lire les messages.

## Exemple

```hcl
module "pubsub" {
  source = "./modules/pubsub"

  name                       = "cloud-project-dev-ingestion"
  ack_deadline_seconds       = 20
  message_retention_duration = "86400s"
  labels                     = { environment = "dev" }
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
| [google_pubsub_subscription.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_subscription) | resource |
| [google_pubsub_topic.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_topic) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Nom du topic ; l'abonnement est nommé <name>-sub. | `string` | n/a | yes |
| ack\_deadline\_seconds | Délai d'acquittement des messages, en secondes (10 à 600). | `number` | `20` | no |
| labels | Labels appliqués au topic et à l'abonnement. | `map(string)` | `{}` | no |
| message\_retention\_duration | Durée de rétention des messages non acquittés (ex : "86400s"). | `string` | `"604800s"` | no |

## Outputs

| Name | Description |
|------|-------------|
| subscription\_name | Nom de l'abonnement. |
| topic\_id | ID complet du topic (projects/<id>/topics/<name>). |
| topic\_name | Nom du topic. |
<!-- END_TF_DOCS -->
