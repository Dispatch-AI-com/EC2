#######################################################################################
# ECR repositories
#######################################################################################
module "ecr_frontend" {
  source                = "../../modules/ECR"
  repository_name       = "dispatchai-frontend-uat"
}

module "ecr_backend" {
  source                = "../../modules/ECR"
  repository_name       = "dispatchai-backend-uat"
}

module "ecr_backend_ai" {
  source                = "../../modules/ECR"
  repository_name       = "dispatchai-backend-ai-uat"
}
