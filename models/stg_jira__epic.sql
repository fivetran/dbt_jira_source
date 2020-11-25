
with base as (

    select * 
    from {{ ref('stg_jira__epic_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_jira__epic_tmp')),
                staging_columns=get_epic_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
        done as is_done,
        id as epic_id,
        key as epic_key,
        name as epic_name,
        summary as epic_issue_name,
        _fivetran_synced

    from fields
)

select * from final
