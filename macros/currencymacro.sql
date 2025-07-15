{% macro currencymacro(order_total,currency_cd) %}
    {% if currency_cd == 'eur' %}
        {{order_total}} * 0.01
            {% elif currency_cd == 'yen' %}
                {{order_total}} * 1.72
    {% endif %}    
{% endmacro %}

 