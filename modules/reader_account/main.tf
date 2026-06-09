resource "snowflake_managed_account" "reader" {
    name = var.account_name
    admin_name = var.admin_name
    admin_password = var.admin_password
    type = "READER"
    comment = var.comment
}
