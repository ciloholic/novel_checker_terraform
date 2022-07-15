data "google_project" "novel_checker" {
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
  type      = string
  sensitive = true
}
variable "ssh_key" {
  type      = string
  sensitive = true
}
variable "allow_ip" {
  type = string
}

locals {
  project_config = {
    name    = var.project_name
    region  = var.region
    env     = var.env
    prefix  = "${var.project_name}-${var.env}"
    email   = var.email
    ssh_key = var.ssh_key
  }
  network_config = {
    allow_ip = var.allow_ip
  }
  api_services = ["iap.googleapis.com"]
}
