{#
  We're using `.call_macro()` here in order to avoid changing the call stack.
  We don't want to change the call stack because dbt checks the call stack is only its own materialization.
  References:
    - https://github.com/dbt-labs/dbt-core/blob/00a531d9d644e6bead6a209bc053b05ae02e48f6/core/dbt/clients/jinja.py#L328
    - https://github.com/dbt-labs/dbt-core/blob/6130a6e1d0d29b257fbcd1b17fcd730383d73ce0/core/dbt/context/providers.py#L1319
#}


{% materialization table, default %}
  {% set relations = dbt.materialization_table_default.call_macro() %}
  {% if not elementary.is_elementary_enabled() %}
    {% do return(relations) %}
  {% endif %}

  {% set metrics = elementary.query_metrics() %}
  {% do elementary.cache_metrics(metrics) %}
  {% do return(relations) %}
{% endmaterialization %}

{% materialization table, adapter="snowflake", supported_languages=["sql", "python"] %}
  {% set relations = dbt.materialization_table_snowflake.call_macro() %}
  {% if not elementary.is_elementary_enabled() %}
    {% do return(relations) %}
  {% endif %}

  {% set metrics = elementary.query_metrics() %}
  {% do elementary.cache_metrics(metrics) %}
  {% do return(relations) %}
{% endmaterialization %}

{% materialization table, adapter="bigquery", supported_languages=["sql", "python"] %}
  {% set relations = dbt.materialization_table_bigquery.call_macro() %}
  {% if not elementary.is_elementary_enabled() %}
    {% do return(relations) %}
  {% endif %}

  {% set metrics = elementary.query_metrics() %}
  {% do elementary.cache_metrics(metrics) %}
  {% do return(relations) %}
{% endmaterialization %}

{% materialization table, adapter="duckdb", supported_languages=["sql", "python"] %}
  {% set relations = dbt.materialization_table_duckdb.call_macro() %}
  {% if not elementary.is_elementary_enabled() %}
    {% do return(relations) %}
  {% endif %}

  {% set metrics = elementary.query_metrics() %}
  {% do elementary.cache_metrics(metrics) %}
  {% do return(relations) %}
{% endmaterialization %}

{% materialization table, adapter="spark", supported_languages=["sql", "python"] %}
  {% set relations = dbt.materialization_table_spark.call_macro() %}
  {% if not elementary.is_elementary_enabled() %}
    {% do return(relations) %}
  {% endif %}

  {% set metrics = elementary.query_metrics() %}
  {% do elementary.cache_metrics(metrics) %}
  {% do return(relations) %}
{% endmaterialization %}

{% materialization table, adapter="databricks", supported_languages=["sql", "python"] %}
  {% set relations = dbt.materialization_table_databricks.call_macro() %}
  {% if not elementary.is_elementary_enabled() %}
    {% do return(relations) %}
  {% endif %}

  {% set metrics = elementary.query_metrics() %}
  {% do elementary.cache_metrics(metrics) %}
  {% do return(relations) %}
{% endmaterialization %}
