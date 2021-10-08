<ul class="menu nav-menu">
  {% unless site.root_item.hidden? %}
    <li class="menu-item{% if site.root_item.selected? %} active{% endif %}">
      <a href="{{ site.root_item.url }}">{{ site.root_item.title }}</a>
    </li>
  {% endunless %}

  {% for item in site.visible_menuitems %}
    {% if site.root_item.layout_title == product_list_layout %}
      {% if editmode %}
        {% include "menu-level-1-link" render_hidden_categories: true %}
      {% else %}
        {% unless show_product_related_pages_in_main_menu %}
          {% unless item.layout_title == product_list_layout or item.layout_title == product_layout %}
            {% include "menu-level-1-link" %}
          {% endunless %}
        {% else %}
          {% include "menu-level-1-link" %}
        {% endunless %}
      {% endif %}
    {% else %}
      {% include "menu-level-1-link" %}
    {% endif %}
  {% endfor %}

  {% if editmode %}
    {% if site.hidden_menuitems.size > 0 %}
      <li class="editmode-button">{% menubtn site.hidden_menuitems %}</li>
    {% endif %}

    <li class="editmode-button" {% unless nav-menu == "mobile-menu" %}{{ edy_intro_add_page }}{% endunless %}>{% menuadd %}</li>
  {% endif %}
</ul>
