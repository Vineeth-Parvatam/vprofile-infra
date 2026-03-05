terraform {
  backend "s3" {
    bucket = "s3-tf-us-east-1"
    key    = "vprofile/ecr/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
}