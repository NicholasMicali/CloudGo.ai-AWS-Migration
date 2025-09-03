# Monitoring Module

This module provisions centralized AWS CloudWatch monitoring and logging for your application and infrastructure. It creates log groups, metric alarms, log metric filters, SNS alert topics, and streams logs to S3 via Kinesis Firehose.

## Features
- CloudWatch log groups for application and infrastructure logs
- Basic metric alarms (CPU, memory, RDS status, etc.)
- Log metric filters for error detection
- SNS topic for alert notifications
- Streams all logs to S3 via Kinesis Firehose for centralized retention

## Inputs
| Name              | Description                                                      | Type   | Default |
|-------------------|------------------------------------------------------------------|--------|---------|
| log_group_names   | Map of log group logical names to config (name, retention, etc.) | map    | {...}   |
| metric_alarms     | Map of alarm logical names to alarm config                       | any    | {}      |
| sns_topic_name    | Name for the SNS topic for alerts                               | string | ...     |
| firehose_stream_name | Name of the Kinesis Firehose stream for S3 delivery           | string |         |
| log_metric_filters| Map of log group names to log metric filter definitions          | map    | {}      |
| s3_bucket_arn     | ARN of the S3 bucket for centralized logging                    | string |         |

## Outputs
| Name              | Description                              |
|-------------------|------------------------------------------|
| log_group_names   | Names of the created log groups          |
| alarm_arns        | ARNs of the created CloudWatch alarms    |
| sns_topic_arn     | ARN of the SNS topic for alerts          |
| firehose_stream_arn | ARN of the Kinesis Firehose stream     |

## Usage Example
```hcl
module "monitoring" {
  source              = "./modules/monitoring"
  firehose_stream_name = "cloudgo-logs-firehose"
  s3_bucket_arn        = module.s3.bucket_arn
}
```

## Notes
- You must create the S3 bucket for centralized logging separately (see `modules/s3`).
- Metric alarms and log metric filters are customizable via variables.
- IAM roles for Firehose and log subscription are provisioned automatically.
