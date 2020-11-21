with base as (
    
    select * 
    from {{ ref('stg_jira__issue_tmp') }}
    
    where not coalesce(_fivetran_deleted, false)
),

fields as (

    select 

        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_jira__issue_tmp')),
                staging_columns=get_issue_columns()
            )
        }}

    from base
),

final as (

    select
    _fivetran_synced,
    coalesce(original_estimate, _original_estimate) as original_estimate_seconds,
    coalesce(remaining_estimate, _remaining_estimate) as remaining_estimate_seconds,
    coalesce(time_spent, _time_spent) as time_spent_seconds,
    assignee_user_id,
    created_at,
    creator_user_id,
    description,
    due_date,
    environment,
    issue_id,
    issue_type_id,
    issue_key,
    parent_issue_id,
    alias: priority_id,
    project_id,
    reporter_user_id,
    resolution_id,
    resolved_at,
    status_id,
    status_changed_at,
    issue_name,
    updated_at,
    work_ratio
)

-- todo: check about _original_estimate and stuff
select * from fields
