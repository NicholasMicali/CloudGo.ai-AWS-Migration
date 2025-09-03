output "log_group_names" {
  description = "Names of the created CloudWatch log groups."
  value       = [for k, v in var.log_group_names : v.name]
}

output "alarm_arns" {
  description = "ARNs of the created CloudWatch alarms."
  value       = module.cloudwatch.alarm_arns
}

output "sns_topic_arn" {
  description = "ARN of the SNS topic for alerts."
  value       = aws_sns_topic.alerts.arn
}

output "firehose_stream_arn" {
  description = "ARN of the Kinesis Firehose delivery stream."
  value       = aws_kinesis_firehose_delivery_stream.logs_to_s3.arn
}
