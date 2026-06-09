output "account_name" {
    value = snowflake_managed_account.reader.name
}

output "account_locator" {
    value = snowflake_managed_account.reader.locator
}

output "account_url" {
    value = snowflake_managed_account.reader.url
}
