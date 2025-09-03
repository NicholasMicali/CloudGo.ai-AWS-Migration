# CloudWatch Monitoring Module
#
# Provisions log groups, metric alarms, log metric filters, SNS alert topics, and log streaming to S3 via Firehose.

module "cloudwatch" {
  source = "terraform-aws-modules/cloudwatch/aws"

  # Log groups for app and infra logs
  log_groups = var.log_group_names

  # Metric alarms (merge defaults with user-provided)
  metric_alarms = length(var.metric_alarms) > 0 ? var.metric_alarms : local.default_metric_alarms

  # Log metric filters for error detection
  log_metric_filters = var.log_metric_filters
}

# SNS topic for CloudWatch alarm notifications
resource "aws_sns_topic" "alerts" {
  name = var.sns_topic_name
}

# CloudWatch Logs subscription filter to stream logs to Kinesis Firehose (for S3 delivery)
resource "aws_cloudwatch_log_subscription_filter" "to_firehose" {
  for_each        = var.log_group_names
  name            = "${each.value.name}-to-firehose"
  log_group_name  = each.value.name
  filter_pattern  = ""
  destination_arn = aws_kinesis_firehose_delivery_stream.logs_to_s3.arn
  role_arn        = aws_iam_role.firehose_subscription.arn
}

# Kinesis Firehose delivery stream (assumes S3 bucket is configured elsewhere)
resource "aws_kinesis_firehose_delivery_stream" "logs_to_s3" {
  name        = var.firehose_stream_name
  destination = "s3"

  s3_configuration {
    role_arn           = aws_iam_role.firehose_delivery.arn
    bucket_arn         = var.s3_bucket_arn
    buffer_size        = 5
    buffer_interval    = 300
    compression_format = "GZIP"
  }
}

# IAM role for Firehose to write to S3
resource "aws_iam_role" "firehose_delivery" {
  name = "firehose_delivery_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "firehose.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy" "firehose_delivery_policy" {
  name = "firehose_delivery_policy"
  role = aws_iam_role.firehose_delivery.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["s3:PutObject", "s3:PutObjectAcl"]
        Resource = "${var.s3_bucket_arn}/*"
      }
    ]
  })
}

# IAM role for log subscription filter
resource "aws_iam_role" "firehose_subscription" {
  name = "firehose_subscription_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "logs.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy" "firehose_subscription_policy" {
  name = "firehose_subscription_policy"
  role = aws_iam_role.firehose_subscription.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["firehose:PutRecord", "firehose:PutRecordBatch"]
        Resource = aws_kinesis_firehose_delivery_stream.logs_to_s3.arn
      }
    ]
  })
}
