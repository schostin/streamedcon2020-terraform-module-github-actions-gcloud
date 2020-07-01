variable "project_id" {
  type        = string
  description = "The project id for which the new repository shall be created."
}

variable "org_id" {
  type        = string
  description = "The organization id under which the project was created."
}

variable "domain" {
  type        = string
  description = "The domain used for templating."
}

variable "name" {
  type        = string
  description = "The name of the repository to create"
}

variable "description" {
  type        = string
  description = "The description of the repository to create"
  default     = ""
}

variable "bucket" {
  type        = string
  description = "The full qualified name of the bucket to store the terraform states"
}

variable "service_account_email" {
  type        = string
  description = "The service account that github actions will use within the repository"
}

variable "github_token" {
  type        = string
  description = "The github token to authenticate against the Github API"
}

variable "github_owner" {
  type        = string
  description = "The github organization or user under which the repository will be created"
}

variable "github_template_owner" {
  type        = string
  description = "The github organization or user that hosts the template for this repository"
}

variable "github_template_repository" {
  type        = string
  description = "The github repository name that hosts the templates"
}
