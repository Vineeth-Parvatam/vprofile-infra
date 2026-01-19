terraform{
    backend "s3" {
      bucket = "s3-tf-us-east-1"
      key    = "s3-tf-us-east-1/vprofile/vpc/terraform.tfstate"
      region = "us-east-1"
      dynamodb_table = "tf-dynamoDB"
      encrypt = true
    }
}