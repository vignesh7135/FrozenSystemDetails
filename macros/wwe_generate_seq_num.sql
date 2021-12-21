{% macro wwe_generate_seq_num(column_name, tab_name) %}
{{ return(adapter.dispatch('wwe_generate_seq_num')(column_name, tab_name)) }}
{% endmacro %}
{%- macro default__wwe_generate_seq_num(column_name, tab_name) -%}
{%- set source_relation = adapter.get_relation(
      database=tab_name.database,
      schema=tab_name.schema,
      identifier=tab_name.identifier) -%}
{% set table_exists=source_relation is not none  %}
{% if table_exists %}
{%- call statement('gen_seq', fetch_result=True) -%}
select coalesce(max({{column_name}}),0) mx from {{tab_name}}
{%- endcall %}
{% if execute %}
    {%- set max_existing_total = load_result('gen_seq').table.columns['mx'].values()[0] ~ "+row_number() over()"-%}
    {{ return(max_existing_total) }}
{% endif %}
{% else %}
{%- set max_existing_total = "row_number() over()"-%}
{{ return(max_existing_total) }}
{% endif %}
{%- endmacro %}