terraform {
  cloud {
    organization = "MathanRamalingam"
    workspaces {
      name = "snowflake-infrastructure"
    }
  }
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.89"
    }
  }
}

provider "snowflake" {
  organization_name = var.snowflake_organization
  account_name      = var.snowflake_account
  user              = var.snowflake_user
  password          = var.snowflake_password
  role              = "ACCOUNTADMIN"
}

resource "snowflake_warehouse" "transform_wh" {
  name           = "TRANSFORM_WH"
  warehouse_size = "x-small"
  auto_suspend   = 60
  auto_resume    = true
  comment        = "Transformation warehouse — managed by Terraform"
}

resource "snowflake_resource_monitor" "transform_monitor" {
  name            = "TRANSFORM_MONITOR"
  credit_quota    = 10
  frequency       = "MONTHLY"
  start_timestamp = "IMMEDIATELY"
  notify_triggers = [50, 80]
  suspend_trigger = 100
}

resource "snowflake_account_role" "analyst_role" {
  name    = "ANALYST_ROLE_TF"
  comment = "Analyst role — managed by Terraform"
}

resource "snowflake_grant_privileges_to_account_role" "analyst_warehouse" {
  privileges        = ["USAGE"]
  account_role_name = snowflake_account_role.analyst_role.name
  on_account_object {
    object_type = "WAREHOUSE"
    object_name = snowflake_warehouse.transform_wh.name
  }
}

module "asko_reader" {
  source           = "./modules/reader_account"
  account_name     = "ASKO_READER"
  admin_name       = "asko_admin"
  admin_password   = var.asko_admin_password
  warehouse_size   = "x-small"
  credit_quota     = 50
  notify_triggers  = [50, 80]
  suspend_trigger  = 100
  analyst_username = "asko_analyst"
  analyst_password = var.asko_analyst_password
  comment          = "Reader Account for ASKO Transport"
}

output "asko_reader_url" {
  value = module.asko_reader.account_url
}

output "asko_reader_locator" {
  value = module.asko_reader.account_locator
}
