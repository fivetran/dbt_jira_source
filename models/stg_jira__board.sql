with base as (

    select *
    from {{ ref('stg_jira__board_tmp') }} 

),

fields as (

    select 

        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_jira__board_tmp')),
                staging_columns=get_board_columns()
            )
        }}

    from base
)

select * from fields