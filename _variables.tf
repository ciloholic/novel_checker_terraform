data "google_project" "main" {
  project_id = var.project_name
}

variable "project_name" {
  type = string
}
variable "region" {
  type = string
}
variable "zone" {
  type = string
}
variable "env" {
  type = string
}
variable "email" {
  type = string
}

locals {
  project_config = {
    name   = var.project_name
    region = var.region
    env    = var.env
    prefix = "${var.project_name}-${var.env}"
    email  = var.email
  }
  api_services = ["iap.googleapis.com"]
}
