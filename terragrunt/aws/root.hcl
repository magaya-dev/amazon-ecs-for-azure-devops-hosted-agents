# This file is used to configure the root module for the Terragrunt project.

remote_state {
  backend = "s3"
  config = {
    bucket       = "terraform-backend-${get_env("AWS_ENV")}-bucket"
    key          = "terragrunt/${path_relative_to_include()}/terraform.tfstate"
    region       = get_env("AWS_REGION")
    encrypt      = true
    use_lockfile = true
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}