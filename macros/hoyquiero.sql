{% macro hoyquiero(flavor, dessert = 'ice cream') %}
Today I want {{flavor}} {{dessert}}!
{% endmacro %}

{% macro hoyquiero2(flavor, dessert = 'cake') %}
Today I want {{flavor}} {{dessert}}!
{% endmacro %}