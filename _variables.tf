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

locals {
  project_config = {
    name   = var.project_name
    env    = var.env
    prefix = "${var.project_name}-${var.env}"
  }
}
