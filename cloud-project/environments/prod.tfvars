project_name = "cloud-project"
environment  = "prod"
owner        = "fa-syaka-diouf"

bucket_location      = "EU"
bucket_storage_class = "STANDARD"
bucket_versioning    = true # forcé de toute façon en prod (local.is_prod)

message_retention_duration = "604800s" # 7 jours
ack_deadline_seconds       = 60
