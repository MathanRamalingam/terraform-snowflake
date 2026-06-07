terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.89"
    }
  }
}

provider "snowflake" {
  account   = var.snowflake_account
  username  = var.snowflake_username
  password  = var.snowflake_password
  role      = "ACCOUNTADMIN"
}

resource "snowflake_warehouse" "transform_wh" {
  name           = "TRANSFORM_WH"
  warehouse_size = "x-small"
  auto_suspend   = 60
  auto_resume    = true
  comment        = "Transformation warehouse managed by Terraform"
}

resource "snowflake_resource_monitor" "transform_monitor" {
  name            = "TRANSFORM_MONITOR"
  credit_quota    = 10
  frequency       = "MONTHLY"
  start_timestamp = "2026-07-01 00:00"

  notify_triggers = [50, 80]
  suspend_trigger = 100
}

resource "snowflake_account_role" "analyst_role" {
  name    = "ANALYST_ROLE_TF"
  comment = "Analyst role managed by Terraform"
}

resource "snowflake_grant_privileges_to_account_role" "analyst_warehouse" {
  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.analyst_role.name
  on_account_object {
    object_type = "WAREHOUSE"
    object_name = snowflake_warehouse.transform_wh.name
  }
}
