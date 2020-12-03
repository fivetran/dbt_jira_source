with base as (

    select * 
    from {{ ref('stg_jira__sprint_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_jira__sprint_tmp')),
                staging_columns=get_sprint_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
        
        id as sprint_id,
        name as sprint_name,
        board_id,
        complete_date as completed_at,
        end_date as ended_at,
        start_date as started_at,
        _fivetran_synced

    from fields
)

select * from final
