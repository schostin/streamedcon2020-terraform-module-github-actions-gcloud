remote_state {
  backend = "gcs"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "${bucket}"
    prefix = "$${path_relative_to_include()}"
  }
}

inputs = {
  project_id = "${project_id}"
  org_id     = "${org_id}"
  domain     = "${domain}"
}
