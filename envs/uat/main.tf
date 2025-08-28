#######################################################################################
# ECR repositories
#######################################################################################
module "ecr_frontend" {
  source                = "../../modules/ECR"
  repository_name       = "dispatchai-uat-frontend"
}

module "ecr_backend" {
  source                = "../../modules/ECR"
  repository_name       = "dispatchai-uat-backend"
}

module "ecr_backend_ai" {
  source                = "../../modules/ECR"
  repository_name       = "dispatchai-uat-backend-ai"
}
