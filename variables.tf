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