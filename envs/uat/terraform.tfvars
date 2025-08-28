aws_region   = "ap-southeast-2"
project_name = "DispatchAI"
environment  = "UAT"

# vpc
# vpc_cidr             = "10.0.0.0/16"
# public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
# private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
# availability_zone    = ["ap-southeast-2a", "ap-southeast-2b"]

# Secrets for backend
backend_secret_name = "backend/env"
backend_secret_key_value = {
  MONGODB_URI            = ""
  REDIS_URL              = ""
  JWT_SECRET             = ""
  JWT_ALGORITHM          = ""
  JWT_EXPIRE_TIME        = ""
  STRIPE_PUBLISHABLE_KEY = ""
  STRIPE_SECRET_KEY      = ""
  STRIPE_WEBHOOK_SECRET  = ""
  OPENAI_API_KEY         = ""
  TWILIO_ACCOUNT_SID     = ""
  TWILIO_AUTH_TOKEN      = ""
  GOOGLE_CLIENT_ID       = ""
  GOOGLE_CLIENT_SECRET   = ""
  GOOGLE_CALLBACK_URL    = ""
  DB_PASSWORD            = ""
  DB_USERNAME            = ""
}
