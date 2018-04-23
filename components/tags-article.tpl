{% if article.tags.size > 0 or editmode %}
  {% if editmode %}
    <div class="tags-editor">{% editable article.tags %}</div>
  {% else %}
    <div class="tag-icon"></div>
    <div class="tags-list">
      {% for tag in article.tags %}
        <a class="tag-link" href="/{{ article.page.path_with_lang }}/tagged/{{ tag.path }}">{{ tag.name }}</a>{% unless forloop.last %}, {% endunless %}
      {% endfor %}
    </div>
  {% endif %}
{% endif %}
