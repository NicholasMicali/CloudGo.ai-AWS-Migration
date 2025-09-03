variable "repository_url" {
  description = "URL of the GitHub repository for the frontend."
  type        = string
}

variable "github_token" {
  description = "GitHub access token for Amplify to access the repository."
  type        = string
  sensitive   = true
}

variable "domain_name" {
  description = "Custom domain name to associate with Amplify app."
  type        = string
}

variable "route53_zone_id" {
  description = "Route53 Hosted Zone ID for DNS validation."
  type        = string
}

variable "environment_variables" {
  description = "Map of environment variables for the Amplify app."
  type        = map(string)
  default     = {}
}

variable "cloudfront_enabled" {
  description = "Whether to provision a CloudFront distribution in front of Amplify."
  type        = bool
  default     = false
}

variable "cloudfront_config" {
  description = "Optional map of CloudFront configuration overrides."
  type        = map(any)
  default     = {}
}
