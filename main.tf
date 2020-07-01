terraform {
  required_version = "0.12.28"
  required_providers {
    github      = "2.9.0"
    google-beta = "3.28.0"
    template    = "2.1.2"
  }
}

provider "google-beta" {
  project = var.project_id
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
}

data "template_file" "main_terragrunt_hcl" {
  template = "${file("${path.module}/templates/terragrunt.hcl")}"
  vars = {
    project_id = var.project_id
    bucket     = var.bucket
  }
}

resource "github_repository_file" "main_terragrunt_hcl" {
  repository = github_repository.repository.name
  file       = "terragrunt.hcl"
  content    = data.template_file.main_terragrunt_hcl.rendered
}

data "template_file" "cloudbuild_yaml" {
  template = "${file("${path.module}/templates/cloudbuild.yaml")}"
}

resource "github_repository_file" "cloudbuild_yaml" {
  repository = github_repository.repository.name
  file       = "cloudbuild.yaml"
  content    = data.template_file.cloudbuild_yaml.rendered
}

resource "google_cloudbuild_trigger" "cloudbuild_trigger" {
  provider = google-beta
  filename = "cloudbuild.yaml"
  github {
    owner = var.github_owner
    name  = github_repository.repository.name
    push {
      branch = ".*"
    }
  }
}
