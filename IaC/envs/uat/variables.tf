variable "aws_region" {
  description = "aws_region"
  type        = string
}

variable "project_name" {
  description = "The project name."
  type        = string
}

variable "environment" {
  description = "The environment name."
  type        = string
}

# variable "vpc_cidr" {
#   description = "The IPv4 CIDR block for the VPC."
#   type        = string
# }

# variable "public_subnet_cidrs" {
#   description = "public subnet cidrs blocks"
#   type        = list(string)
# }

# variable "private_subnet_cidrs" {
#   description = "private subnet cidrs blocks"
#   type        = list(string)
# }

# variable "availability_zone" {
#   description = "AWS availability zones"
#   type        = list(string)
# }

# Secret manager.
variable "backend_secret_name" {
  description = "Secret name in AWS Secrets Manager."
  type        = string
}

variable "backend_secret_key_value" {
  description = "Map of key-value pairs for backend secret"
  type        = map(string)
}
