{{ config(enabled=var('jira_using_version', True)) }}

select * from {{ var('version') }}
