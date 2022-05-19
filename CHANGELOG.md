# dbt_jira_source v0.5.0
## 🎉 Documentation and Feature Updates
- Updated README documentation updates for easier navigation and setup of the dbt package
- Added `jira_[source_table_name]_identifier` variables to allow for easier flexibility of the package to refer to source tables with different names.
# dbt_jira_source v0.4.0
🎉 dbt v1.0.0 Compatibility 🎉
## 🚨 Breaking Changes 🚨
- Adjusts the `require-dbt-version` to now be within the range [">=1.0.0", "<2.0.0"]. Additionally, the package has been updated for dbt v1.0.0 compatibility. If you are using a dbt version <1.0.0, you will need to upgrade in order to leverage the latest version of the package.
  - For help upgrading your package, I recommend reviewing this GitHub repo's Release Notes on what changes have been implemented since your last upgrade.
  - For help upgrading your dbt project to dbt v1.0.0, I recommend reviewing dbt-labs [upgrading to 1.0.0 docs](https://docs.getdbt.com/docs/guides/migration-guide/upgrading-to-1-0-0) for more details on what changes must be made.
- Upgrades the package dependency to refer to the latest `dbt_fivetran_utils`. The latest `dbt_fivetran_utils` package also has a dependency on `dbt_utils` [">=0.8.0", "<0.9.0"].
  - Please note, if you are installing a version of `dbt_utils` in your `packages.yml` that is not in the range above then you will encounter a package dependency error.
 
 
# dbt_jira_source v0.3.2
## Fixes
- Adjusted the `stg_jira__issue` and `stg_jira__issue_field_history` timestamp fields for `redshift` warehouses to explicitly cast the data type as `timestamp without time zone`. This ensures downstream `datediff` and `dateadd` functions to not result in an error if the timestamps are synced as `timestamp_tz`. ([#24](https://github.com/fivetran/dbt_jira_source/pull/24))

# dbt_jira_source v0.1.0 -> v0.3.1
Refer to the relevant release notes on the Github repository for specific details for the previous releases. Thank you!
