resource "google_service_account" "novel_checker" {
  account_id = local.project_config.name
}
