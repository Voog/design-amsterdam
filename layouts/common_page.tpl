<!DOCTYPE html>
{%- include "template-settings" -%}
{%- include "template-variables" -%}
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign common_page = true %}
  {% include "html-head" common_page: true %}
  {% include "edicy-tools-variables" %}
  {% include "common-page-variables" %}
</head>

<body class="common-page content-page{% if site.search.enabled %} search-enabled{% endif %}{% if editmode or site.has_many_languages? %} lang-enabled{% endif %} {% if flags_state %}flags-enabled{% else %}flags-disabled{% endif %}">
  <div class="container">
    {% include "header" %}
    <section class="content-header content-formatted cfx" data-search-indexing-allowed="true">
      {%- assign content_default_title = "content" | lce -%}
      {%- assign content_default_title_tooltip = "content_tooltip_specific_page" | lce -%}
      {% content name="slogan" title=content_default_title title_tooltip=content_default_title_tooltip %}
    </section>
    <main class="content" role="main">
      {%- if sidebar_active -%}
        {% include "sidebar-left"%}
      {%- endif -%}
      <section class="content-body content-formatted" data-search-indexing-allowed="true">
        {%- assign bottom_content_title = "additional_content" | lce -%}
        {%- assign bottom_content_title_tooltip = "content_tooltip_additional_information" | lce -%}
        {% content title=bottom_content_title title_tooltip=bottom_content_title_tooltip %}
      </section>
    </main>
    {% include "footer" %}
  </div>
  {% include "site-signout" %}
  {% include "javascripts" %}
  {% include "edicy-tools" %}
  <script>site.initCommonPage({% if editmode %}false{% else %}true{% endif %});</script>
</body>
</html>
