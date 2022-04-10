resource "google_project_service" "enabled" {
  for_each           = toset(local.api_services)
  service            = each.key
  disable_on_destroy = false
}

resource "google_project_iam_custom_role" "novel_checker_role" {
  title   = replace("${local.project_config.name}-role", "-", " ")
  role_id = replace("${local.project_config.name}-role", "-", "_")

  permissions = [
    "compute.projects.get",
    "compute.instances.get",
    "compute.instances.setMetadata",
    "iam.serviceAccounts.actAs",
    "iap.tunnelInstances.accessViaIAP"
  ]
}

resource "google_project_iam_member" "member" {
  project = data.google_project.main.project_id
  role    = google_project_iam_custom_role.novel_checker_role.id
  member  = "user:${local.project_config.email}"
}
