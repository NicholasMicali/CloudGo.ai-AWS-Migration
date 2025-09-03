output "budget_name" {
  description = "The name of the budget"
  value       = aws_budgets_budget.budget.name
}

output "budget_arn" {
  description = "The ARN of the budget"
  value       = aws_budgets_budget.budget.arn
}

output "budget_amount" {
  description = "The budget amount"
  value       = var.budget_amount
}

output "currency" {
  description = "The currency of the budget"
  value       = var.currency
}

output "contact_emails" {
  description = "List of contact emails for notifications"
  value       = var.contact_emails
}
