# VPC Terraform Module

This module provisions an AWS VPC using the [terraform-aws-modules/vpc/aws](https://github.com/terraform-aws-modules/terraform-aws-vpc) community module. It creates a VPC with public and private subnets across multiple AZs, NAT gateways, flow logs, and tagging.

## Features
- Configurable CIDR block
- Public and private subnets across multiple AZs
- NAT gateways (single or per AZ)
- Route tables for public/private subnets
- VPC Flow Logs
- Least privilege network ACLs and security groups
- Resource tagging

## Usage
```hcl
module "vpc" {
  source = "./modules/vpc"

  name            = "my-vpc"
  cidr            = "10.0.0.0/16"
  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true

  enable_flow_log = true
  flow_log_destination_type = "cloud-watch-logs"
  flow_log_destination_arn  = "arn:aws:logs:us-east-1:123456789012:log-group:/aws/vpc/flowlogs"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }

  # Example least privilege rules
  default_network_acl_ingress = []
  default_network_acl_egress  = []
  default_security_group_ingress = []
  default_security_group_egress  = []
}
```

## Outputs
- `vpc_id` - The VPC ID
- `public_subnet_ids` - List of public subnet IDs
- `private_subnet_ids` - List of private subnet IDs
- `nat_gateway_ids` - List of NAT Gateway IDs
- `internet_gateway_id` - The Internet Gateway ID
