{% macro drop_id_field(column_id) %}

SPLIT_PART({{ column_id}}, '_', 3)
    
{% endmacro %}