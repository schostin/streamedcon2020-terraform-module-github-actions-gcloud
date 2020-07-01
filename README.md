# Github Cloud Build Terraform Module

A terraform module to create a new repository for a project and link Cloudbuild with it.

## Terraform Module

### Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.28 |
| github | >= 2.9.0 |
| google | >= 3.28.0 |
| template | >= 2.1.2 |

### Providers

| Name | Version |
|------|---------|
| github | >= 2.9.0 |
| google | >= 3.28.0 |
| template | >= 2.1.2 |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bucket | The full qualified name of the bucket to store the terraform states | `string` | n/a | yes |
| description | The description of the repository to create | `string` | `""` | no |
| domain | The domain used for templating. | `string` | n/a | yes |
| github\_owner | The github organization or user under which the repository will be created | `string` | n/a | yes |
| github\_template\_owner | The github organization or user that hosts the template for this repository | `string` | n/a | yes |
| github\_template\_repository | The github repository name that hosts the templates | `string` | n/a | yes |
| github\_token | The github token to authenticate against the Github API | `string` | n/a | yes |
| name | The name of the repository to create | `string` | n/a | yes |
| org\_id | The organization id under which the project was created. | `string` | n/a | yes |
| project\_id | The project id for which the new repository shall be created. | `string` | n/a | yes |
| service\_account\_email | The service account that github actions will use within the repository | `string` | n/a | yes |

### Outputs

| Name | Description |
|------|-------------|
| repository\_html\_url | The HTML Url of the repository |
| repository\_http\_clone\_url | The HTML Clone Url of the repository |
| repository\_name | The full name of the created repository in the form owner/repository\_name |

## Tools

### TFLint

I am using [TFLint](https://github.com/terraform-linters/tflint) in version `v0.17.0` to lint the terraform files for basic stuff.
The implemented and activated rules can be found in the file [.tflint.hcl](./.tflint.hcl). Documentation about those rules can be 
found [here](https://github.com/terraform-linters/tflint/tree/master/docs/rules).

TFLint currently supports AWS resources and terraform resources out of the box. Google Cloud support is being worked on. Contributions are
welcome [here](https://github.com/terraform-linters/tflint-ruleset-google).
