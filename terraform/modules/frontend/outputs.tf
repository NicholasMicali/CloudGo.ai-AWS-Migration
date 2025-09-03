output "amplify_app_arn" {
  description = "ARN of the Amplify app."
  value       = aws_amplify_app.this.arn
}

output "amplify_default_domain" {
  description = "Default Amplify domain for the app."
  value       = aws_amplify_app.this.default_domain
}

output "cloudfront_domain_name" {
  description = "CloudFront distribution domain name (if enabled)."
  value       = var.cloudfront_enabled ? module.cloudfront[0].this_cloudfront_distribution_domain_name : null
}
