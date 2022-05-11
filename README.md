<p align="center">
    <a alt="License"
        href="https://github.com/fivetran/dbt_jira_source/blob/main/LICENSE">
        <img src="https://img.shields.io/badge/License-Apache%202.0-blue.svg" /></a>
    <a alt="Fivetran-Release"
        href="https://fivetran.com/docs/getting-started/core-concepts#releasephases">
        <img src="https://img.shields.io/badge/Fivetran Release Phase-_Beta-orange.svg" /></a>
    <a alt="dbt-core">
        <img src="https://img.shields.io/badge/dbt_Core™_version->=1.0.0_<2.0.0-orange.svg" /></a>
    <a alt="Maintained?">
        <img src="https://img.shields.io/badge/Maintained%3F-yes-green.svg" /></a>
    <a alt="PRs">
        <img src="https://img.shields.io/badge/Contributions-welcome-blueviolet" /></a>
</p>

# Jira Source dbt Package ([Docs](https://fivetran.github.io/dbt_jira_source/))
# 📣 What does this dbt package do?
- Cleans, tests, and prepares your Jira data from [Fivetran's connector](https://fivetran.com/docs/applications/jira) for analysis.
- Generates a comprehensive data dictionary of your Jira data through the [dbt docs site](https://fivetran.github.io/dbt_jira_source/)
- Materializes staging tables that leverage data in the format described by [this ERD](https://fivetran.com/docs/applications/jira/#schemainformation). These tables are designed to work simultaneously with our [Jira modeling package](https://github.com/fivetran/dbt_jira). Learn more about these models on the [dbt docs site](https://fivetran.github.io/dbt_jira_source/#!/overview/jira_source/models/?g_v=1).

# 🎯 How do I use the dbt package?
## Step 1: Prerequisites
To use this dbt package, you must have the following:
- At least one Fivetran Jira connector syncing data into your destination. 
- A **BigQuery**, **Snowflake**, **Redshift**, or **PostgreSQL** destination.

## Step 2: Install the package
Include the following jira_source package version in your `packages.yml` file.
> TIP: Check [dbt Hub](https://hub.getdbt.com/) for the latest installation instructions or [read the dbt docs](https://docs.getdbt.com/docs/package-management) for more information on installing packages.
```yaml
packages:
  - package: fivetran/jira_source
    version: [">=0.5.0", "<0.6.0"]
```
## Step 3: Define database and schema variables
By default, this package runs using your target database and the `jira` schema. If this is not where your Jira data is (for example, if your Jira schema is named `jira_fivetran` and your `issue` table is named `usa_issue`), add the following configuration to your root `dbt_project.yml` file:

```yml
vars:
    jira_database: your_database_name
    jira_schema: your_schema_name 
```
## Step 4: Disable models for non-existent sources
Your Jira connector may not sync every table that this package expects. If you do not have the `SPRINT`, `COMPONENT`, or `VERSION` tables synced, add the following variable to your root `dbt_project.yml` file:

```yml
vars:
    jira_using_sprints: false   # Disable if you do not have the sprint table, or if you do not want sprint related metrics reported
    jira_using_components: false # Disable if you do not have the component table, or if you do not want component related metrics reported
    jira_using_versions: false # Disable if you do not have the versions table, or if you do not want versions related metrics reported
```

## (Optional) Step 5: Additional configurations
<details><summary>Expand to view configurations</summary>
    
### Change the build schema
By default, this package builds the Jira staging models within a schema titled (`<target_schema>` + `_stg_jira`) in your target database. If this is not where you would like your Jira staging data to be written to, add the following configuration to your root `dbt_project.yml` file:

```yml
models:
    jira_source:
      +schema: my_new_schema_name # leave blank for just the target_schema
```
    
### Change the source table references
If an individual source table has a different name than the package expects, add the table name as it appears in your destination to the respective variable:
> IMPORTANT: See this project's [dbt_project.yml](https://github.com/fivetran/dbt_jira_source/blob/main/dbt_project.yml) variable declarations to see the expected names.
    
```yml
vars:
    jira_<default_source_table_name>_identifier: your_table_name 
```
    
</details>

## (Optional) Step 6: Orchestrate your models with Fivetran Transformations for dbt Core™
<details><summary>Expand to view details</summary>
<br>
    
Fivetran offers the ability for you to orchestrate your dbt project through [Fivetran Transformations for dbt Core™](https://fivetran.com/docs/transformations/dbt). Learn how to set up your project for orchestration through Fivetran in our [Transformations for dbt Core setup guides](https://fivetran.com/docs/transformations/dbt#setupguide).
</details>
    
# 🔍 Does this package have dependencies?
This dbt package is dependent on the following dbt packages. For more information on the following packages, refer to the [dbt hub](https://hub.getdbt.com/) site.
> IMPORTANT: If you have any of these dependent packages in your own `packages.yml` file, we highly recommend that you remove them to avoid package version conflicts.
```yml
packages:
    - package: fivetran/fivetran_utils
      version: [">=0.3.0", "<0.4.0"]

    - package: dbt-labs/dbt_utils
      version: [">=0.8.0", "<0.9.0"]
```
          
# 🙌 How is this package maintained and can I contribute?
## Package Maintenance
The Fivetran team maintaining this package _only_ maintains the latest version of the package. We highly recommend that you stay consistent with the [latest version](https://hub.getdbt.com/fivetran/jira_source/latest/) of the package and refer to the [CHANGELOG](https://github.com/fivetran/dbt_jira_source/blob/main/CHANGELOG.md) and release notes for more information on changes across versions.

## Contributions
A small team of analytics engineers at Fivetran develops these dbt packages. However, the packages are made better by community contributions! 

We highly encourage and welcome contributions to this package. Check out [this dbt Discourse article](https://discourse.getdbt.com/t/contributing-to-a-dbt-package/657) to learn how to contribute to a dbt package!

# 🏪 Are there any resources available?
- If you have questions or want to reach out for help, please refer to the [GitHub Issue](https://github.com/fivetran/dbt_jira_source/issues/new/choose) section to find the right avenue of support for you.
- If you would like to provide feedback to the dbt package team at Fivetran or would like to request a new dbt package, fill out our [Feedback Form](https://www.surveymonkey.com/r/DQ7K7WW).
- Have questions or want to just say hi? Book a time during our office hours [on Calendly](https://calendly.com/fivetran-solutions-team/fivetran-solutions-team-office-hours) or email us at solutions@fivetran.com.
