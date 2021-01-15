{{ config(enabled=var('using_sprints', True)) }}

select * from {{ var('sprint') }}