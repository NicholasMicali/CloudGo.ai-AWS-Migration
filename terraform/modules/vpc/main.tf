# VPC module using terraform-aws-modules/terraform-aws-vpc
# This module provisions a VPC with public/private subnets, NAT, flow logs, and tagging.

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.0"

  name = var.name
  cidr = var.cidr

  azs             = var.azs
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway

  enable_flow_log           = var.enable_flow_log
  flow_log_destination_type = var.flow_log_destination_type
  flow_log_destination_arn  = var.flow_log_destination_arn

  tags = var.tags

  # Network ACLs and security groups for least privilege
  manage_default_network_acl     = true
  manage_default_security_group  = true
  default_network_acl_ingress    = var.default_network_acl_ingress
  default_network_acl_egress     = var.default_network_acl_egress
  default_security_group_ingress = var.default_security_group_ingress
  default_security_group_egress  = var.default_security_group_egress
}
