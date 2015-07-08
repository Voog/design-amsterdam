<ul class="menu nav-menu">
  {% unless site.root_item.hidden? %}
    <li {% if site.root_item.selected? %} class="active"{% endif %}>
      <a href="{{ site.root_item.url }}">{{ site.root_item.title }}</a>
    </li>
  {% endunless %}

  {% for item in site.visible_menuitems %}
    <li{% if item.selected? %} class="active"{% endif %}>
      <a{% unless item.translated? %} class="untranslated fci-editor-menuadd"{% endunless %} href="{{ item.url }}">{{ item.title }}</a>
    </li>
  {% endfor %}

  {% if editmode %}
    {% if site.hidden_menuitems.size > 0 %}
      <li class="editmode-button">{% menubtn site.hidden_menuitems %}</li>
    {% endif %}

    <li class="editmode-button">{% menuadd %}</li>
  {% endif %}
</ul>
