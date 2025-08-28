provider "aws" {
  region = "ap-southeast-2"

  default_tags {
    tags = {
      "ManagedBy"   = "Terraform"
      "Project"     = var.project_name
      "Environment" = var.environment
    }
  }
}