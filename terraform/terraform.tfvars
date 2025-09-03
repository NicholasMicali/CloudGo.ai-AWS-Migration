# Example terraform.tfvars for CloudGo AWS Migration
# Fill in these values with your actual environment details before running Terraform

aws_region         = "us-west-2"         # AWS region to deploy resources in
backend_bucket     = "cloudgo-tfstate"   # S3 bucket for Terraform remote state
backend_key        = "env/dev/terraform.tfstate" # Path/key for the state file in the S3 bucket
backend_dynamodb_table = "cloudgo-tf-lock" # DynamoDB table for state locking

vpc_cidr           = "10.0.0.0/16"       # CIDR block for the VPC
private_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"] # List of private subnet CIDRs
public_subnet_cidrs  = ["10.0.101.0/24", "10.0.102.0/24"] # List of public subnet CIDRs

db_name            = "cloudgo_db"        # Name for the RDS database
db_username        = "admin"             # Username for the RDS database
db_password        = "REPLACE_ME"        # Password for the RDS database (set to a secure value!)

domain_name        = "app.cloudgo.ai"    # Domain name for the frontend application
frontend_repo_url  = "https://github.com/cloudgo/frontend.git" # Frontend repo URL
backend_repo_url   = "https://github.com/cloudgo/backend.git"  # Backend repo URL

# Add more variables as needed for S3, monitoring, etc.
