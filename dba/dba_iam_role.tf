# a role for custom PostgreSQL DBA tasks 
# https://cloud.google.com/sql/docs/postgres/iam-permissions
# resource "google_project_iam_custom_role" "cloudsql-dba-iam-role" {
#   role_id     = "cloudSqlDbaRole"
#   title       = "CloudSQL DBA Role"
#   description = "A description"
#   permissions = ["iam.roles.list", "iam.roles.create", "iam.roles.delete"]
# }