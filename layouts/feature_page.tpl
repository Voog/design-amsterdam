<!DOCTYPE html>
{% include "template-variables" %}
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign front_page = true %}
  {% include "html-head" front_page: true %}
  {% include "edicy-tools-variables" %}
  {% include "edicy-tools-styles" %}
</head>

<body class="front-page{% if site.search.enabled %} search-enabled{% endif %}{% if editmode or site.has_many_languages? %} lang-enabled{% endif %} {% if flags_state %}flags-enabled{% else %}flags-disabled{% endif %}">
  <div class="container">
    {% include "header" %}
    <main class="content" role="main">
      <div class="header-banner js-header-banner js-background-type {{ header_bg_type }}">
        {% if editmode %}<button class="voog-bg-picker-btn js-background-settings" {% unless header_bg_image == '' %}data-bg-image="{{ header_bg_image }}"{% endunless %} {% unless header_bg_image_sizes == '' %}data-bg-image-sizes="{{ header_bg_image_sizes_str | escape }}"{% endunless %} {% unless header_bg_color == nil or header_bg_color == 'rgba(255,255,255,0)' %}data-bg-color="{{ header_bg_color }}"{% endunless %} {% unless header_bg_color_data == nil %}data-bg-color-data="{{ header_bg_color_data_str | escape }}"{% endunless %}></button>{% endif %}
        <div class="background-color"></div>
        <div class="header-body">
          <div class="header-inner content-formatted cfx" {{ edy_intro_edit_text }}>{% content %}</div>
        </div>
      </div>

      <div class="wrap js-topbar-init">
        <section class="content-body content-formatted cfx" data-search-indexing-allowed="true">{% content name="default" %}</section>
      </div>
    </main>
    {% include "footer" %}
  </div>
  {% include "javascripts" %}
  {% include "edicy-tools" %}
  <script>site.initFrontPage({% if editmode %}false{% else %}true{% endif %});</script>
</body>
</html>
