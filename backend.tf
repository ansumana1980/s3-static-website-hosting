```md
👉 See backend setup instructions in backend.setup.md
````
# create s3 backend for state management
terraform {
  backend "s3" {
    bucket  = "ansu-s3-static-website-state"             # your unique bucket name
    key     = "ansu-s3-static-website/terraform.tfstate" # path to the state file
    region  = "us-east-1"
    encrypt = true
  }
}