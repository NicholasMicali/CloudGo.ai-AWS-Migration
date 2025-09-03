resource "aws_budgets_budget" "budget" {
  name         = var.budget_name
  budget_type  = "COST"
  limit_amount = tostring(var.budget_amount)
  limit_unit   = var.currency
  time_unit    = "MONTHLY"

  notification {
    comparison_operator          = "GREATER_THAN"
    threshold                   = 80
    threshold_type              = "PERCENTAGE"
    notification_type           = "ACTUAL"
    subscriber_email_addresses  = var.contact_emails
  }

  notification {
    comparison_operator          = "GREATER_THAN"
    threshold                   = 95
    threshold_type              = "PERCENTAGE"
    notification_type           = "FORECASTED"
    subscriber_email_addresses  = var.contact_emails
  }

  notification {
    comparison_operator          = "GREATER_THAN"
    threshold                   = 100
    threshold_type              = "PERCENTAGE"
    notification_type           = "FORECASTED"
    subscriber_email_addresses  = var.contact_emails
  }
}
