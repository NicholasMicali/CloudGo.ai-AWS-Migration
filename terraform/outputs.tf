# Root outputs to expose key infrastructure information

output "rds_endpoint" {
  description = "RDS database endpoint"
  value       = module.rds.endpoint
}

output "rds_arn" {
  description = "RDS database ARN"
  value       = module.rds.arn
}

output "amplify_url" {
  description = "Amplify default domain for frontend"
  value       = module.frontend.amplify_default_domain
}

output "cloudfront_domain_name" {
  description = "CloudFront domain name for frontend"
  value       = module.frontend.cloudfront_domain_name
}

output "api_gateway_endpoint" {
  description = "API Gateway endpoint for backend (if available)"
  value       = module.backend.api_gateway_endpoint
}

output "s3_bucket_name" {
  description = "S3 bucket name for static assets/logs"
  value       = module.s3.bucket_name
}

output "monitoring_sns_topic_arn" {
  description = "SNS Topic ARN for monitoring alerts"
  value       = module.monitoring.sns_topic_arn
}
