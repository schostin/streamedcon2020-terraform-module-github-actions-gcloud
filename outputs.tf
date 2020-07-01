output "repository_name" {
  value       = github_repository.repository.full_name
  description = "The full name of the created repository in the form owner/repository_name"
}

output "repository_html_url" {
  value       = github_repository.repository.html_url
  description = "The HTML Url of the repository"
}

output "repository_http_clone_url" {
  value       = github_repository.repository.http_clone_url
  description = "The HTML Clone Url of the repository"
}
