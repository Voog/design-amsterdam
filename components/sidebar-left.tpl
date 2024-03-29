{% for item in site.menuitems %}
  {% if item.selected? and item.children? or editmode %}
    <aside class="sidebar sidebar-left">
      <section class="content-formatted cfx">
        <nav class="sub-menu">
          <ul class="menu nav-menu">
            <li{% if item.current? %} class="active"{% endif %}><a href="{{ item.url }}">{{ item.title }}</a></li>
            {% if editmode or item.children? %}
              {%- if item.layout_title == product_layout or item.layout_title == product_list_layout  -%}
                {% for subitem in item.visible_children %}
                  {% if subitem.layout_title != product_layout and subitem.layout_title != product_list_layout %}
                    <li {% if subitem.selected? %} class="active"{% endif %}><a href="{{ subitem.url }}" {% unless subitem.translated? %} class="untranslated fci-editor-menuadd"{% endunless %}>{{ subitem.title }}</a></li>
                  {% endif %}
                {% endfor %}
              {%- else -%}
                {% for subitem in item.visible_children %}
                  <li {% if subitem.selected? %} class="active"{% endif %}><a href="{{ subitem.url }}" {% unless subitem.translated? %} class="untranslated fci-editor-menuadd"{% endunless %}>{{ subitem.title }}</a></li>
                {% endfor %}
              {%- endif -%}
            {% endif %}
            {% if editmode and item.hidden_children.size > 0 %}<li class="editmode-button">{% menubtn item.hidden_children %}</li>{% endif %}
            {% if editmode %}<li class="editmode-button">{% menuadd parent="item" %}</li>{% endif %}
          </ul>
        </nav>
      </section>
    </aside>
  {% endif %}
{% endfor %}
