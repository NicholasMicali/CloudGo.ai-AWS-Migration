# Input variables for the RDS module

variable "identifier" {
  description = "The name of the RDS instance."
  type        = string
}

variable "engine_version" {
  description = "The version of PostgreSQL to use."
  type        = string
  default     = "13.7"
}

variable "instance_class" {
  description = "The instance type of the RDS instance."
  type        = string
  default     = "db.t3.medium"
}

variable "allocated_storage" {
  description = "The allocated storage in GBs."
  type        = number
  default     = 100
}

variable "max_allocated_storage" {
  description = "The upper limit to which RDS can automatically scale the storage."
  type        = number
  default     = 200
}

variable "multi_az" {
  description = "Specifies if the RDS instance is multi-AZ."
  type        = bool
  default     = true
}

variable "backup_retention_period" {
  description = "The days to retain backups for."
  type        = number
  default     = 7
}

variable "backup_window" {
  description = "The daily time range during which automated backups are created."
  type        = string
  default     = "03:00-04:00"
}

variable "storage_encrypted" {
  description = "Specifies whether the DB instance is encrypted."
  type        = bool
  default     = true
}

variable "kms_key_id" {
  description = "The ARN of the KMS key to use for encryption."
  type        = string
}

variable "iam_database_authentication_enabled" {
  description = "Enable IAM database authentication."
  type        = bool
  default     = true
}

variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs to associate."
  type        = list(string)
}

variable "subnet_ids" {
  description = "List of subnet IDs for the RDS subnet group."
  type        = list(string)
}

variable "monitoring_interval" {
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected."
  type        = number
  default     = 60
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}
