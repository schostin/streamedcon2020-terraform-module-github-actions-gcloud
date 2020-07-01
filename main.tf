terraform {
  required_version = ">= 0.12.28"
  required_providers {
    github   = ">= 2.9.0"
    google   = ">= 3.28.0"
    template = ">= 2.1.2"
  }
}

provider "github" {
  token = var.github_token
  owner = var.github_owner
}

resource "github_repository" "repository" {
  name        = var.name
  description = var.description

  visibility = "public"
  auto_init  = true
  template {
    owner      = var.github_template_owner
    repository = var.github_template_repository
  }
}

data "template_file" "main_terragrunt_hcl" {
  template = "${file("${path.module}/templates/terragrunt.hcl")}"
  vars = {
    project_id      = var.project_id
    bucket          = var.bucket
    org_id          = var.org_id
    domain          = var.domain
    billing_account = var.billing_account
  }
}

resource "github_repository_file" "main_terragrunt_hcl" {
  repository = github_repository.repository.name
  file       = "terragrunt.hcl"
  content    = data.template_file.main_terragrunt_hcl.rendered
}

resource "google_service_account_key" "service_account_key" {
  service_account_id = var.service_account_email
}

resource "github_actions_secret" "google_credentials" {
  repository      = github_repository.repository.name
  secret_name     = "GOOGLE_CREDENTIALS"
  plaintext_value = base64decode(google_service_account_key.service_account_key.private_key)
}

data "template_file" "initial_github_action" {
  template = "${file("${path.module}/templates/validate_gcloud_connection.yml")}"
}

resource "github_repository_file" "initial_github_action" {
  repository = github_repository.repository.name
  file       = ".github/workflows/validate_gcloud_connection.yml"
  content    = data.template_file.initial_github_action.rendered

  depends_on = [
    github_actions_secret.google_credentials
  ]
}

resource "github_actions_secret" "github_admin_token" {
  repository      = github_repository.repository.name
  secret_name     = "GITHUB_ADMIN_TOKEN"
  plaintext_value = var.github_token
}