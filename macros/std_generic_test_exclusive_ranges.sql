{% test only_numbers(model, column_name) %}

with validation as(
    select
        {{column_name}} as number_field
    from {{model}}
),
validation_errors as (
    select
        number_field
    from validation
    where is_integer(number_field) = 0
)

select * from validation_errors


{% endtest %}