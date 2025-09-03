# RDS PostgreSQL Module

This module provisions an Amazon RDS PostgreSQL instance with best practices using the [terraform-aws-modules/rds/aws](https://github.com/terraform-aws-modules/terraform-aws-rds) community module.

## Features
- Multi-AZ deployment
- Automated backups (retention period and backup window configurable)
- Point-in-time recovery (PITR) enabled
- Encryption at rest using a KMS key
- IAM database authentication enabled
- VPC isolation (private subnet IDs and security groups)
- Enhanced monitoring with IAM role
- Deletion protection enabled by default

## Usage
```hcl
module "rds" {
  source  = "./modules/rds"

  identifier = "my-postgres-db"
  engine_version = "13.7"
  instance_class = "db.t3.medium"
  allocated_storage = 100
  max_allocated_storage = 200
  multi_az = true
  backup_retention_period = 7
  backup_window = "03:00-04:00"
  storage_encrypted = true
  kms_key_id = aws_kms_key.rds_key.arn
  iam_database_authentication_enabled = true
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  subnet_ids = module.vpc.private_subnet_ids
  monitoring_interval = 60
  tags = {
    Environment = "prod"
    Terraform   = "true"
  }
}
```

## Inputs
See `variables.tf` for all configurable inputs.

## Outputs
- `endpoint` - The connection endpoint for the RDS instance
- `arn` - The ARN of the RDS instance
- `status` - The status of the RDS instance

## Notes
- You must provide a KMS key ARN for encryption.
- Security groups and subnet IDs must be provided for VPC isolation.
- Enhanced monitoring IAM role is created automatically.

For advanced configuration, refer to the [terraform-aws-modules/rds/aws documentation](https://github.com/terraform-aws-modules/terraform-aws-rds).
