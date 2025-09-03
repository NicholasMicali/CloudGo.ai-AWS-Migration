provider "aws" {
  region = var.aws_region
}

# VPC Module
module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr             = var.vpc_cidr
  private_subnet_cidrs = var.private_subnet_cidrs
  public_subnet_cidrs  = var.public_subnet_cidrs
}

# RDS Module
module "rds" {
  source             = "./modules/rds"
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  db_name            = var.db_name
  db_username        = var.db_username
  db_password        = var.db_password
}

# Frontend Module
module "frontend" {
  source      = "./modules/frontend"
  domain_name = var.domain_name
  repo_url    = var.frontend_repo_url
  vpc_id      = module.vpc.vpc_id
}

# Backend Module (placeholder, add variables as needed)
module "backend" {
  source      = "./modules/backend"
  repo_url    = var.backend_repo_url
  vpc_id      = module.vpc.vpc_id
  db_endpoint = module.rds.endpoint
}

# S3 Module (placeholder, add variables as needed)
module "s3" {
  source = "./modules/s3"
}

# Monitoring Module
module "monitoring" {
  source        = "./modules/monitoring"
  vpc_id        = module.vpc.vpc_id
  s3_bucket_arn = module.s3.bucket_arn
  rds_arn       = module.rds.arn
  sns_topic_arn = module.monitoring.sns_topic_arn
}

# Budget Module
module "budget" {
  source        = "./budget"
  budget_amount = 200
  currency      = "USD"
  contact_emails = ["njmicali@gmail.com"]
}
