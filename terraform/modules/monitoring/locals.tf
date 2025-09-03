locals {
  # Example default alarms for demonstration. Override via variable for real use.
  default_metric_alarms = {
    ecs_cpu_high = {
      alarm_name          = "HighCPUUtilization"
      comparison_operator = "GreaterThanThreshold"
      evaluation_periods  = 2
      threshold           = 80
      metric_name         = "CPUUtilization"
      namespace           = "AWS/ECS"
      statistic           = "Average"
      alarm_actions       = [aws_sns_topic.alerts.arn]
    }
    rds_status = {
      alarm_name          = "RDSInstanceDown"
      comparison_operator = "LessThanThreshold"
      evaluation_periods  = 1
      threshold           = 1
      metric_name         = "DatabaseConnections"
      namespace           = "AWS/RDS"
      statistic           = "Minimum"
      alarm_actions       = [aws_sns_topic.alerts.arn]
    }
  }
}
