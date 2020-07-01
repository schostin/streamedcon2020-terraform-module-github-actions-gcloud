# Github Cloud Build Terraform Module

A terraform module to create a new repository for a project and link Cloudbuild with it.

## Terraform Module



## Tools

### TFLint

I am using [TFLint](https://github.com/terraform-linters/tflint) in version `v0.17.0` to lint the terraform files for basic stuff.
The implemented and activated rules can be found in the file [.tflint.hcl](./.tflint.hcl). Documentation about those rules can be 
found [here](https://github.com/terraform-linters/tflint/tree/master/docs/rules).

TFLint currently supports AWS resources and terraform resources out of the box. Google Cloud support is being worked on. Contributions are
welcome [here](https://github.com/terraform-linters/tflint-ruleset-google).
