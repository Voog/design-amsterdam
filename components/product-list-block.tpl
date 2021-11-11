<div class="flex_col w-100">
  {% include "menu-breadcrumbs" %}
  <div class="product_list flex_row flex_row-3 mar_0-16-neg pad_16-0">
    {% for item in page.menuitem.visible_children_with_data %}
      {% if item.layout_title == product_list_layout or item.layout_title == product_layout %}
        {% include "product-list-block-item", _entityData: item %}
      {% endif %}
    {% endfor %}
  </div>
</div>
