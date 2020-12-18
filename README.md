# Jira (Source) 

This package models Jira data from [Fivetran's connector](https://fivetran.com/docs/applications/jira). It uses data in the format described by [this ERD](https://docs.google.com/presentation/d/1UPq2CWnqQpbjLxkTrcWvAekaZ0o0OdzXODTVmUXeGvs/edit#slide=id.g5f1e6b049a_8_0). 

> Note: this schema applies to Jira connectors set up or fully re-synced after September 10, 2020.

This package enriches your Fivetran data by doing the following:
- Adds descriptions to tables and columns that are synced using Fivetran
- Adds column-level testing where applicable. For example, all primary keys are tested for uniqueness and non-null values.
- Models staging tables, which will be used in our transform package

> The Jira source dbt package is compatible with BigQuery, Redshift, and Snowflake.

## Models
This package contains staging models, designed to work simultaneously with our [Jira modeling package](https://github.com/fivetran/dbt_jira).  The staging models:
- Remove any rows that are soft-deleted
- Name columns consistently across all packages:
    - Boolean fields are prefixed with `is_` or `has_`
    - Timestamps are appended with `_at`
    - ID primary keys are prefixed with the name of the table.  For example, the `issue` table's ID column is renamed `issue_id`.
    - Foreign keys include the table that they refer to. For example, an issue's `assignee` user ID column is renamed `assignee_user_id`.

## Installation Instructions
Check [dbt Hub](https://hub.getdbt.com/) for the latest installation instructions, or [read the dbt docs](https://docs.getdbt.com/docs/package-management) for more information on installing packages.

## Configuration
By default, this package looks for your Jira data in the `jira` schema of your [target database](https://docs.getdbt.com/docs/running-a-dbt-project/using-the-command-line-interface/configure-your-profile). If this is not where your Jira data is, add the following configuration to your `dbt_project.yml` file:

```yml
# dbt_project.yml

...
config-version: 2

vars:
    jira_database: your_database_name
    jira_schema: your_schema_name 
```

## Contributions
Additional contributions to this package are very welcome! Please create issues
or open PRs against `master`. Check out 
[this post](https://discourse.getdbt.com/t/contributing-to-a-dbt-package/657) 
on the best workflow for contributing to a package.

## Resources:
- Provide [feedback](https://www.surveymonkey.com/r/DQ7K7WW) on our existing dbt packages or what you'd like to see next
- Have questions or feedback, or need help? Book a time during our office hours [here](https://calendly.com/fivetran-solutions-team/fivetran-solutions-team-office-hours) or shoot us an email at solutions@fivetran.com.
- Find all of Fivetran's pre-built dbt packages in our [dbt hub](https://hub.getdbt.com/fivetran/)
- Learn how to orchestrate dbt transformations with Fivetran [here](https://fivetran.com/docs/transformations/dbt).
- Learn more about Fivetran overall [in our docs](https://fivetran.com/docs)
- Check out [Fivetran's blog](https://fivetran.com/blog)
- Learn more about dbt [in the dbt docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](http://slack.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the dbt blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
