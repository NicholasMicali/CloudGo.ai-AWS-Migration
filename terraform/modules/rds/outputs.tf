# Outputs for the RDS module

output "endpoint" {
  description = "The connection endpoint for the RDS instance."
  value       = module.rds.db_instance_endpoint
}

output "arn" {
  description = "The ARN of the RDS instance."
  value       = module.rds.db_instance_arn
}

output "status" {
  description = "The status of the RDS instance."
  value       = module.rds.db_instance_status
}
