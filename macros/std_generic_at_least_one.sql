{% test test_at_least_one(model, column_name) %}

select *
from (
    select
        {# In TSQL, subquery aggregate columns need aliases #}
        {# thus: a filler col name, 'filler_column' #}
      count({{ column_name }}) as filler_column

    from {{ model }}

    having count({{ column_name }}) = 0

) validation_errors

{% endtest %}