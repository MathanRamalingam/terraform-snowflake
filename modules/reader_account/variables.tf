variable "account_name" {
    description = "Reader account main"
    type = string
}

variable "admin_name" {
    description = "admin username for reader account"
    type = string
}

variable "admin_password" {
    description = "admin password for reader account"
    type = string
    sensitive = true
}

variable "warehouse_size" {
  description = "Warehouse size for customer"
  type        = string
  default     = "x-small"
}

variable "credit_quota" {
  description = "Monthly credit quota for resource monitor"
  type        = number
  default     = 50
}

variable "notify_triggers" {
  description = "Credit percentages to trigger notifications"
  type        = list(number)
  default     = [50, 80]
}

variable "suspend_trigger" {
  description = "Credit percentage to suspend warehouse"
  type        = number
  default     = 100
}

variable "analyst_username" {
  description = "Analyst user login name in Reader Account"
  type        = string
}

variable "analyst_password" {
  description = "Analyst user password in Reader Account"
  type        = string
  sensitive   = true
}


variable "comment" {
  description = "Customer description"
  type        = string
  default     = ""
}
