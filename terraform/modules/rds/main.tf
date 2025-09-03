# RDS PostgreSQL instance using terraform-aws-modules/rds/aws
# This module provisions a Multi-AZ, encrypted, IAM-enabled RDS PostgreSQL instance with backups and enhanced monitoring.

module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 5.0"

  identifier     = var.identifier
  engine         = "postgres"
  engine_version = var.engine_version
  instance_class = var.instance_class

  multi_az = var.multi_az

  allocated_storage     = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage

  backup_retention_period = var.backup_retention_period
  backup_window           = var.backup_window

  storage_encrypted = var.storage_encrypted
  kms_key_id        = var.kms_key_id

  iam_database_authentication_enabled = var.iam_database_authentication_enabled

  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_ids             = var.subnet_ids
  create_db_subnet_group = true

  monitoring_interval    = var.monitoring_interval
  create_monitoring_role = true

  # Enable deletion protection by default for safety
  deletion_protection = true

  tags = var.tags
}
