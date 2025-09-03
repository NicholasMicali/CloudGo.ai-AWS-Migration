# Budget Module

This module creates an AWS budget with email notifications.

## Inputs

- `budget_amount` (number): The budget limit amount. Required.
- `currency` (string): The currency for the budget. Default is `USD`.
- `contact_emails` (list of strings): List of email addresses to notify. Required.
- `budget_name` (string): Optional name for the budget. Default is `budget-AWS-CloudGo`.

## Usage

In your root `main.tf`, add:

```hcl
module "budget" {
  source        = "./budget"
  budget_amount = 200
  currency      = "USD"
  contact_emails = ["njmicali@gmail.com"]
}
```

## Notes

- The budget period is monthly.
- Notifications are sent at 80% actual, 95% forecasted, and 100% forecasted thresholds.
- Email notifications are wired directly via `subscriber_email_addresses`.

## TODO

- No additional variables required for AWS.

## Outputs

- `budget_name`: The name of the budget.
- `budget_arn`: The ARN of the budget.
- `budget_amount`: The budget amount.
- `currency`: The currency.
- `contact_emails`: List of emails notified.
