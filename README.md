> Fivetran's starter project which acts as the foundation to building dbt packages
> Here's a template of the README for both transformation + source packages

# [Connector Name] ([docs](home page of the netlify-hosted docs site)) 

This package models [connector name] data from [Fivetran's connector](https://fivetran.com/docs/applications/connector). It uses data in the format described by [this ERD](link to the connector ERD).

[High level objective of package]. It achieves this by:
- [major thing the package does #1]
- [ #2 ] 
- [ #3]
...

> The [Connector] dbt package is compatible with BigQuery, Redshift, and Snowflake.

## Models - transformation package version

This package contains transformation models, designed to work simultaneously with our [Connector source package](link to source package repo). A dependency on the source package is declared in this package's `packages.yml` file, so it will automatically download when you run `dbt deps`. The primary outputs of this package are described below. Intermediate models are used to create these output models.

| **model**                | **description**                                                                                                                                |
| ------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| [conector__model_1](link to model sql file on github)             | toot toot |
| [conector__model_2](link to model sql file on github)             | beep beep |

## Models - source package version

This package contains staging models, designed to work simultaneously with our [Connector modeling package](link to transformation package repo).  The staging models:
* Remove any rows that are soft-deleted
* Name columns consistently across all packages:
    * Boolean fields are prefixed with `is_` or `has_`
    * Timestamps are appended with `_at`
    * ID primary keys are prefixed with the name of the table.  For example, a user table's ID column is renamed user_id.
    * Foreign keys include the table that they refer to. For example, a project table's owner ID column is renamed owner_user_id.
* [anything else?]

## Installation Instructions
Check [dbt Hub](https://hub.getdbt.com/) for the latest installation instructions, or [read the dbt docs](https://docs.getdbt.com/docs/package-management) for more information on installing packages.

## Configuration
By default, this package looks for your [Connector] data in the `[connector_name]` schema of your [target database](https://docs.getdbt.com/docs/running-a-dbt-project/using-the-command-line-interface/configure-your-profile). If this is not where your [Connector] data is, add the following configuration to your `dbt_project.yml` file:

```yml
# dbt_project.yml

...
config-version: 2

vars:
    connector_database: your_database_name
    connector_schema: your_schema_name 
```

### any additional configurations (ie variables)
[brief explanation]

If you want to [do something], add the following variable to your `dbt_project.yml` file:

```yml
# dbt_project.yml

...
config-version: 2

vars:
  connector:
    example_list_variable: ['the', 'list', 'of', 'values']
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
