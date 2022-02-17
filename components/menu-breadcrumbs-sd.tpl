{%- assign breadcrumbsString = breadcrumbsScript | replace: '<script type="application/ld+json">', '' | replace: "</script>", '' | replace: site.url, '' | replace: '@', '' -%}
{%- assign breadcrumbsObj = breadcrumbsString | json_parse -%}
{%- if breadcrumbsObj.itemListElement.size > 2 -%}
  {%- assign breadcrumbsOffset = 1 -%}
{%- else -%}
  {%- assign breadcrumbsOffset = 0 -%}
{%- endif -%}

<ul class="menu menu-horizontal menu-public menu-breadcrumbs">
  {%- for listItem in breadcrumbsObj.itemListElement offset: breadcrumbsOffset %}
    <li class="menu-item{% if forloop.last %} current{% endif %}">
      <a class="menu-link" href="/{{listItem.item.id}}">{{ listItem.item.name }}</a>
    </li>
    {% unless forloop.last %}
      <span class="menu-separator">/</span>
    {% endunless %}
  {% endfor -%}
</ul>
