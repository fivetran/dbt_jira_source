\n\n
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_jira__status_tmp')),
                staging_columns=get_status_columns()
            )
        }}
