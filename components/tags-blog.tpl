{% if blog.has_tags? %}
<div class="tags-container">
  <nav class="tags">
    <span>{{ 'filter_posts' | lc }}:</span>
    <a class="tag-link js-tags-all{% unless tags.size > 0 %} active{% endunless %}" href="/{{ blog.page.path_with_lang }}">{{ 'all_posts' | lc }}</a>
    {% for tag in blog.tags %}
      {% assign activestr = "" %}
      {% for tmptag in tags %}
        {% if tmptag.name == tag.name %}
          {% assign activestr = " active" %}
        {% endif %}
      {% endfor %}
      <a class="tag-link{{ activestr }}" href="/{{ blog.page.path_with_lang }}/tagged/{{ tag.path }}">{{ tag.name }}</a>
    {% endfor %}
    </ul>
  </nav>
</div>
{% endif %}
