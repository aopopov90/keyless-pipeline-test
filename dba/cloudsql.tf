module "postgresql-db" {
  source               = "../postgresql"
  name                 = "test-1"
  database_version     = "POSTGRES_9_6"
  project_id           = var.project_id
  zone                 = "us-central1-c"
  region               = "us-central1"
  tier                 = "db-f1-micro"
  enable_default_user  = false
  enable_default_db    = false
  deletion_protection  = false

  database_flags = [
    {
      name  = "cloudsql.iam_authentication"
      value = "on"
    }
  ]
  
  create_timeout = "1h"
  update_timeout = "1h"
  delete_timeout = "20m"

  iam_user_emails = [google_service_account.cloudsql-admin-sa.email]
}

# resource "google_sql_user" "admin-user" {
#   name     = replace(google_service_account.cloudsql-admin-sa.email, ".gserviceaccount.com", "")
#   instance = module.postgresql-db.instance_name
#   type     = "CLOUD_IAM_SERVICE_ACCOUNT"
# }
