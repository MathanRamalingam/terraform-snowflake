variable "snowflake_organization" {
  type      = string
}

variable "snowflake_account" {
  type      = string
}

variable "snowflake_user" {
  type      = string
}

variable "snowflake_password" {
  type      = string
  sensitive = true
}

variable "asko_admin_password" {
  type      = string
  sensitive = true
}

variable "asko_analyst_password" {
  type      = string
  sensitive = true
}
