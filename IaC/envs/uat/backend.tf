terraform {
  backend "s3" {
    region         = "ap-southeast-2"
    bucket         = "dispatchai-terraform-state-bucket"
    key            = "uat/terraform.tfstate"
  }
}
