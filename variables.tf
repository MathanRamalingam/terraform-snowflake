variable "snowflake_account" {
  type        = string
  description = "Snowflake account identifier"
}

variable "snowflake_username" {
  type        = string
  description = "Snowflake username"
}

variable "snowflake_password" {
  type        = string
  sensitive   = true
  description = "Snowflake password"
}

variable "asko_admin_password" {
  description = "Admin password for ASKO Reader Account"
  type        = string
  sensitive   = true
}

variable "asko_analyst_password" {
  type      = string
  sensitive = true
}