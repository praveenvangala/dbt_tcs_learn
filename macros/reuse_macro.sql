{% macro createobjs() -%}
    {% set query %}
        create or replace file format ff_csv field_optionally_enclosed_by='\042'
    {% endset %}
    {% do run_query(query) %}
    {% set query %}
        create or replace transient table {{target.database}}.{{target.schema}}.stg_dealership
        (dlrship_id number(9) not null, manager_id number(9),   dlrship_name varchar(30),  
        dlrship_city varchar(30),   dlrship_state varchar(20), dlrship_region varchar(20),  
        dlrship_country varchar(20))  
    {% endset %}
{% do run_query(query) %}
{% endmacro %}
 
{% macro loadtable(tname,stgname,fformat) %}
{% set copy_query %}
begin transaction;
copy into {{tname}} from {{stgname}} file_format = {{fformat}};
commit;
{% endset %}
{% do run_query(copy_query) %}
{% endmacro %}
 