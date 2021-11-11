{%- capture dont_render -%}
  {% for item in site.menuitems_with_hidden %}
    {% if item.selected? %}
      {% if editmode %}
        {% assign sidebar_active = true %}
      {% else %}
        {% if item.layout_title == product_list_layout %}
          {% assign item_content_children_size = 0 %}

          {% for subitem in item.visible_children %}
            {% unless subitem.layout_title == product_list_layout or subitem.layout_title == product_layout %}
              {% assign item_content_children_size = item_content_children_size | plus: 1 %}
            {% endunless %}

            {% if item_content_children_size == 1 %}
              {% assign sidebar_active = true %}
              {% break %}
            {% endif %}
          {% endfor %}
        {% else %}
          {% if item.visible_children.size > 0 %}
            {% assign sidebar_active = true %}
          {% endif %}
        {% endif %}
      {% endif %}
    {% endif %}
  {% endfor %}
{%- endcapture -%}
