# Amplify app for frontend hosting
resource "aws_amplify_app" "this" {
  name         = "frontend-app"
  repository   = var.repository_url
  access_token = var.github_token

  environment_variables = local.amplify_env_vars
}

# Main branch for Amplify deployment
esource "aws_amplify_branch" "main" {
  app_id           = aws_amplify_app.this.id
  branch_name      = "main"
  enable_auto_build = true
}

# ACM certificate for custom domain (DNS validated)
module "acm" {
  source          = "terraform-aws-modules/acm/aws"
  domain_name     = var.domain_name
  zone_id         = var.route53_zone_id
  validation_method = "DNS"
}

# Associate custom domain with Amplify app
resource "aws_amplify_domain_association" "this" {
  app_id     = aws_amplify_app.this.id
  domain_name = var.domain_name

  sub_domain {
    branch_name = aws_amplify_branch.main.branch_name
    prefix      = ""
  }

  depends_on = [module.acm]
}

# Optional: CloudFront distribution in front of Amplify (advanced CDN)
module "cloudfront" {
  source  = "terraform-aws-modules/cloudfront/aws"
  count   = var.cloudfront_enabled ? 1 : 0

  aliases = [var.domain_name]
  origin  = [{
    domain_name = aws_amplify_app.this.default_domain
    origin_id   = "amplify-app"
    custom_origin_config = {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "https-only"
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }]
  viewer_certificate = {
    acm_certificate_arn            = module.acm.acm_certificate_arn
    ssl_support_method             = "sni-only"
    minimum_protocol_version       = "TLSv1.2_2021"
    cloudfront_default_certificate = false
  }
  # Allow user overrides
  dynamic "default_cache_behavior" {
    for_each = lookup(var.cloudfront_config, "default_cache_behavior", [])
    content  = default_cache_behavior.value
  }
  # Pass through any additional config
  dynamic "ordered_cache_behavior" {
    for_each = lookup(var.cloudfront_config, "ordered_cache_behavior", [])
    content  = ordered_cache_behavior.value
  }
}
