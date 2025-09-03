variable "name" {
  description = "Name of the VPC"
  type        = string
}

variable "cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "azs" {
  description = "List of availability zones"
  type        = list(string)
}

variable "public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnet CIDRs"
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Enable NAT gateway(s) for private subnets"
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Use a single NAT gateway (true) or one per AZ (false)"
  type        = bool
  default     = true
}

variable "enable_flow_log" {
  description = "Enable VPC flow logs"
  type        = bool
  default     = true
}

variable "flow_log_destination_type" {
  description = "Type of flow log destination (cloud-watch-logs or s3)"
  type        = string
  default     = "cloud-watch-logs"
}

variable "flow_log_destination_arn" {
  description = "ARN of the destination for VPC flow logs (CloudWatch Log Group or S3 bucket)"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "default_network_acl_ingress" {
  description = "Ingress rules for default network ACL"
  type        = list(any)
  default     = []
}

variable "default_network_acl_egress" {
  description = "Egress rules for default network ACL"
  type        = list(any)
  default     = []
}

variable "default_security_group_ingress" {
  description = "Ingress rules for default security group"
  type        = list(any)
  default     = []
}

variable "default_security_group_egress" {
  description = "Egress rules for default security group"
  type        = list(any)
  default     = []
}
