# dbt_jira_source v0.3.2
## Fixes
- Adjusted the `stg_jira__issue` and `stg_jira__issue_field_history` timestamp fields for `redshift` warehouses to explicitly cast the data type as `timestamp without time zone`. This ensures downstream `datediff` and `dateadd` functions do not result in an error if the timestamps are synced as `timestamp_tz`. ([]())

# dbt_jira_source v0.1.0 -> v0.3.1
Refer to the relevant release notes on the Github repository for specific details for the previous releases. Thank you!
