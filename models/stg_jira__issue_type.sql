with base as (

    select * from 
    {{ ref('stg_jira__issue_type_tmp') }}
    
),

fields as (

    select 
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_jira__issue_type_tmp')),
                staging_columns=get_issue_type_columns()
            )
        }}

    from base
)

select * from fields