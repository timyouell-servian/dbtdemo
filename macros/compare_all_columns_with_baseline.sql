{% macro compare_all_columns_with_baseline(a_relation, b_relation, primary_key, datetime_column_name, month_value, exclude_columns=[], summarize=True, timestamp_snapshot=False) -%}
    {{ return(adapter.dispatch('compare_all_columns_with_baseline')(a_relation, b_relation, primary_key, datetime_column_name, month_value, exclude_columns, summarize, timestamp_snapshot)) }}
{%- endmacro %}

{% macro default__compare_all_columns_with_baseline(a_relation, b_relation, primary_key, datetime_column_name, month_value, exclude_columns=[], summarize=True, timestamp_snapshot=False) -%}

    {% set column_names = dbt_utils.get_filtered_columns_in_relation(from=a_relation, except=exclude_columns) %}

    {% set a_query %}
        select *, {{ primary_key }} as dbt_audit_helper_pk
        from {{ a_relation }}
        where date_part(month, {{ datetime_column_name }}) <= {{ month_value }}
    {% endset %}

    {% set b_query %}
        select *, {{ primary_key }} as dbt_audit_helper_pk
        from {{ b_relation }}
        where date_part(month, {{ datetime_column_name }}) <= {{ month_value }}
        {% if timestamp_snapshot %}
        and dbt_valid_to is null
        {% endif %}
    {% endset %}

    {% for column_name in column_names %}