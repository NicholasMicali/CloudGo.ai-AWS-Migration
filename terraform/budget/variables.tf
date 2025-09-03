variable "budget_amount" {
  description = "The amount for the budget limit"
  type        = number
}

variable "currency" {
  description = "The currency for the budget"
  type        = string
  default     = "USD"
}

variable "contact_emails" {
  description = "List of email addresses to notify for budget alerts"
  type        = list(string)
}

variable "budget_name" {
  description = "Name of the budget"
  type        = string
  default     = "budget-AWS-CloudGo"
}
