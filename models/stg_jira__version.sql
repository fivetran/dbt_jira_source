
with base as (

    select * 
    from {{ ref('stg_jira__version_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_jira__version_tmp')),
                staging_columns=get_version_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
        archived as is_archived,
        description,
        id as version_id,
        name as version_name,
        overdue as is_overdue,
        project_id,
        release_date,
        released as is_released,
        start_date
        
    from fields
)

select * from final