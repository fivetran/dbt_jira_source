<<<<<<< HEAD
select * 
from {{ var('priority') }}
=======
{{ config(enabled=var('jira_using_priorities', True)) }}

select * from {{ var('priority') }}
>>>>>>> 914311b66a0bbbd79bd879cba04468385f63f341
