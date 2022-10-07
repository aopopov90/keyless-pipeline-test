resource "google_service_account" "cloudsql-admin-sa" {
  project      = var.project_id
  account_id   = "cloudsql-admin-sa"
  display_name = "CloudSQL Admin SA"
}

resource "google_project_iam_member" "cloudsq-admin-sa-iam" {
  project = var.project_id
  role    = "roles/cloudsql.admin"
  member  = "serviceAccount:${google_service_account.cloudsql-admin-sa.email}"
}

data "google_project" "project" {
  project_id = var.project_id
}

data "google_iam_policy" "wli_user_ghshr" {
  binding {
    role = "roles/iam.workloadIdentityUser"

    members = [
      "principalSet://iam.googleapis.com/projects/${data.google_project.project.number}/locations/global/workloadIdentityPools/gh-pool/attribute.full/${var.gh_repo}${var.gh_branch}${var.job_workflow_ref}",
      
    ]
  }
}

resource "google_service_account_iam_policy" "admin-account-iam" {
  service_account_id = google_service_account.cloudsql-admin-sa.name
  policy_data        = data.google_iam_policy.wli_user_ghshr.policy_data
}