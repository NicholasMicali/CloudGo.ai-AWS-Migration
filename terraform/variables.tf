# Root module variables for environment configuration

variable "aws_region" {
  description = "AWS region to deploy resources in."
  type        = string
}

variable "backend_bucket" {
  description = "S3 bucket for Terraform remote state."
  type        = string
}

variable "backend_key" {
  description = "Path/key for the Terraform state file in the S3 bucket."
  type        = string
}

variable "backend_dynamodb_table" {
  description = "DynamoDB table for state locking."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDRs."
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDRs."
  type        = list(string)
}

variable "db_name" {
  description = "Name for the RDS database."
  type        = string
}

variable "db_username" {
  description = "Username for the RDS database."
  type        = string
}

variable "db_password" {
  description = "Password for the RDS database."
  type        = string
  sensitive   = true
}

variable "domain_name" {
  description = "Domain name for the frontend application."
  type        = string
}

variable "frontend_repo_url" {
  description = "Repository URL for the frontend application."
  type        = string
}

variable "backend_repo_url" {
  description = "Repository URL for the backend application."
  type        = string
}

# Add more variables as needed for S3, monitoring, etc.
