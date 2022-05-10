<p align="center">
    <a alt="License"
        href="https://github.com/fivetran/dbt_jira_source/blob/main/LICENSE">
        <img src="https://img.shields.io/badge/License-Apache%202.0-blue.svg" /></a>
    <a alt="Fivetran-Release"
        href="https://fivetran.com/docs/getting-started/core-concepts#releasephases">
        <img src="https://img.shields.io/badge/Fivetran Release Phase-_Beta-orange.svg" /></a>
    <a alt="dbt-core">
        <img src="https://img.shields.io/badge/dbt_core-version_>=1.0.0_<2.0.0-orange.svg" /></a>
    <a alt="Maintained?">
        <img src="https://img.shields.io/badge/Maintained%3F-yes-green.svg" /></a>
    <a alt="PRs">
        <img src="https://img.shields.io/badge/Contributions-welcome-blueviolet" /></a>
</p>

# Jira Source dbt Package ([Docs](https://fivetran.github.io/dbt_jira_source/))
# 📣 What does this dbt package do?
- Cleans, tests, and prepares your Jira data from [Fivetran's connector](https://fivetran.com/docs/applications/Jira) for analysis.
- Generates a comprehensive data dictionary of your Jira data via the [dbt docs site](https://fivetran.github.io/dbt_jira_source/)
- Materializes staging tables which leverage data in the format described by [this ERD](https://fivetran.com/docs/applications/jira/#schemainformation) and is intended to work simultaneously with our [Jira modeling package](https://github.com/fivetran/dbt_jira)
    - Refer to our [Docs site](https://fivetran.github.io/dbt_jira_source/#!/overview/jira_source/models/?g_v=1) for more details about these materialized models. 

# 🎯 How do I use the dbt package?
## Step 1: Pre-Requisites
- **Connector**: Have the Fivetran Jira connector syncing data into your warehouse. 
- **Database support**: This package has been tested on **BigQuery**, **Snowflake**, **Redshift**, and **Postgres**. Ensure you are using one of these supported databases.
## Step 2: Installing the Package
Include the following jira_source package version in your `packages.yml`
> Check [dbt Hub](https://hub.getdbt.com/) for the latest installation instructions, or [read the dbt docs](https://docs.getdbt.com/docs/package-management) for more information on installing packages.
```yaml
packages:
  - package: fivetran/jira_source
    version: [">=0.5.0", "<0.6.0"]
```
## Step 3: Configure Your Variables
### Database and Schema Variables
By default, this package will run using your target database and the `jira` schema. If this is not where your Jira data is (perhaps your Jira schema is `jira_fivetran` and your `issue` table is named `usa_issue`), add the following configuration to your root `dbt_project.yml` file:

```yml
vars:
    jira_database: your_database_name
    jira_schema: your_schema_name 
```
### Disabling Components
Your Jira connector might not sync every table that this package expects. If you do not have the `SPRINT`, `COMPONENT`, or `VERSION` tables synced, add the following variable to your root `dbt_project.yml` file:

```yml
vars:
    jira_using_sprints: false   # Disable if you do not have the sprint table, or if you do not want sprint related metrics reported
    jira_using_components: false # Disable if you do not have the component table, or if you do not want component related metrics reported
    jira_using_versions: false # Disable if you do not have the versions table, or if you do not want versions related metrics reported
```

## (Optional) Step 4: Additional Configurations
<details><summary>Expand for instructions</summary>
    
### Change the Build Schema
By default, this package builds the Jira staging models within a schema titled (<target_schema> + `_stg_jira`) in your target database. If this is not where you would like your Jira staging data to be written to, add the following configuration to your root `dbt_project.yml` file:

```yml
models:
    jira_source:
      +schema: my_new_schema_name # leave blank for just the target_schema
```
    
### Change the Source Table References
If an individual source table has a different name than expected (see this projects [dbt_project.yml](https://github.com/fivetran/dbt_jira_source/blob/main/dbt_project.yml) variable declarations for expected names), provide the name of the table as it appears in your warehouse to the respecitve variable as identified below:
```yml
vars:
    jira_<default_source_table_name>_identifier: your_table_name 
```
</details>

## (Optional) Step 5: Orchestrate your models with Fivetran Transformations for dbt Core™
<details><summary>Expand for details</summary>
<br>
    
Fivetran offers the ability for you to orchestrate your dbt project through [Fivetran Transformations for dbt Core™](https://fivetran.com/docs/transformations/dbt). Refer to the linked docs for more information on how to setup your project for orchestration through Fivetran. 
</details>
    
# 🔍 Does this package have dependencies?
This dbt package is dependent on the following dbt packages. For more information on the below packages, refer to the [dbt hub](https://hub.getdbt.com/) site.
> **If you have any of these dependent packages in your own `packages.yml` I highly recommend you remove them to ensure there are no package version conflicts.**
```yml
packages:
    - package: fivetran/fivetran_utils
      version: [">=0.3.0", "<0.4.0"]

    - package: dbt-labs/dbt_utils
      version: [">=0.8.0", "<0.9.0"]
```
          
# 🙌 How is this package maintained and can I contribute?
## Package Maintenance
The Fivetran team maintaining this package **only** maintains the latest version of the package. We highly recommend you stay consistent with the [latest version](https://hub.getdbt.com/fivetran/jira_source/latest/) of the package and refer to the [CHANGELOG](https://github.com/fivetran/dbt_jira_source/blob/main/CHANGELOG.md) and release notes for more information on changes across versions.

## Contributions
These dbt packages are developed by a small team of analytics engineers at Fivetran. However, the packages are made better by community contributions! 

We highly encourage and welcome contributions to this package. Check out [this post](https://discourse.getdbt.com/t/contributing-to-a-dbt-package/657) on the best workflow for contributing to a package!

# 🏪 Are there any resources available?
- If you encounter any questions or want to reach out for help, please refer to the [GitHub Issue](https://github.com/fivetran/dbt_jira_source/issues/new/choose) section to find the right avenue of support for you.
- If you would like to provide feedback to the dbt package team at Fivetran, or would like to request a future dbt package to be developed, then feel free to fill out our [Feedback Form](https://www.surveymonkey.com/r/DQ7K7WW).
- Have questions or want to just say hi? Book a time during our office hours [here](https://calendly.com/fivetran-solutions-team/fivetran-solutions-team-office-hours) or send us an email at solutions@fivetran.com.
