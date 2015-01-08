{% for item in site.visible_menuitems %}
  {% if item.selected? and item.children? or editmode %}
    <aside class="sidebar sidebar-left">
      <section class="content-formatted cfx">
        <nav class="sub-menu">
          <ul class="menu nav-menu">
            <li{% if item.current? %} class="active"{% endif %}><a href="{{ item.url }}">{{ item.title }}</a></li>
            {% if editmode or item.children? %}
              {% for subitem in item.visible_children %}
                <li {% if subitem.selected? %} class="active"{% endif %}><a href="{{ subitem.url }}" {% unless subitem.translated? %} class="untranslated fci-editor-menuadd"{% endunless %}>{{ subitem.title }}</a></li>
              {% endfor %}
            {% endif %}
            {% if editmode and item.hidden_children? %}<li>{% menubtn item.hidden_children %}</li>{% endif %}
            {% if editmode %}<li>{% menuadd parent="item" %}</li>{% endif %}
          </ul>
        </nav>
      </section>
    </aside>
  {% endif %}
{% endfor %}
