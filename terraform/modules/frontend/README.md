# Frontend Hosting Module

This module provisions AWS Amplify hosting for a frontend app, associates a custom domain with HTTPS via ACM, and optionally provisions a CloudFront distribution for advanced CDN features.

## Features
- AWS Amplify app and main branch deployment
- ACM certificate (DNS validated via Route53)
- Custom domain association for Amplify
- Optional CloudFront distribution in front of Amplify

## Usage
```hcl
module "frontend" {
  source            = "./modules/frontend"
  repository_url    = "https://github.com/example/frontend"
  github_token      = var.github_token
  domain_name       = "example.com"
  route53_zone_id   = var.route53_zone_id
  environment_variables = {
    API_URL = "https://api.example.com"
  }
  cloudfront_enabled = true
  cloudfront_config  = {
    # Optional: override default/ordered cache behaviors
  }
}
```

## Inputs
| Name                   | Description                                    | Type         | Default |
|------------------------|------------------------------------------------|--------------|---------|
| repository_url         | GitHub repo URL for Amplify                    | string       | n/a     |
| github_token           | GitHub token for Amplify access                | string       | n/a     |
| domain_name            | Custom domain for Amplify                      | string       | n/a     |
| route53_zone_id        | Route53 zone for DNS validation                | string       | n/a     |
| environment_variables  | Map of Amplify env vars                        | map(string)  | {}      |
| cloudfront_enabled     | Whether to enable CloudFront                   | bool         | false   |
| cloudfront_config      | Optional CloudFront config overrides           | map(any)     | {}      |

## Outputs
| Name                     | Description                                  |
|--------------------------|----------------------------------------------|
| amplify_app_arn          | ARN of the Amplify app                       |
| amplify_default_domain   | Default Amplify domain                       |
| cloudfront_domain_name   | CloudFront distribution domain (if enabled)  |

## Notes
- ACM certificate is DNS validated using Route53. Ensure the zone ID is correct and Terraform can manage DNS records.
- CloudFront is optional; Amplify provides basic CDN by default.
- GitHub token should be stored securely (e.g., Terraform Cloud/Workspaces, Vault).
