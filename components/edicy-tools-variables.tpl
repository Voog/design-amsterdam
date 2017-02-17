{% comment %} TODO: Optimize the logic.{% endcomment %}
{% capture dont_render %}
  {% comment %}Assign language menu flags state{% endcomment %}
  {% if site.data.flags_state == nil %}
    {% assign flags_state = true %}
  {% else %}
    {% assign flags_state = site.data.flags_state %}
  {% endif %}

  {% comment %}Assign variables based on page type.{% endcomment %}
  {% assign header_bg = page.data.header_bg %}
  {% assign header_bg_image = header_bg.image %}
  {% assign header_bg_image_sizes = header_bg.imageSizes %}
  {% assign header_bg_color = header_bg.color %}
  {% assign header_bg_color_data = header_bg.colorData %}
  {% assign header_bg_combined_lightness = header_bg.combinedLightness %}

  {% comment %}Sets the body background type.{% endcomment %}
  {% if header_bg %}
    {% if header_bg_combined_lightness %}
      {% if header_bg_combined_lightness > 0.5 %}
        {% assign header_bg_type = 'light-background' %}
      {% else %}
        {% assign header_bg_type = 'dark-background' %}
      {% endif %}
    {% else %}
      {% if header_bg_color_data.a >= 0.5 %}
        {% if header_bg_color_data.lightness >= 0.5 %}
          {% assign header_bg_type = 'light-background' %}
        {% else %}
          {% assign header_bg_type = 'dark-background' %}
        {% endif %}
      {% else %}
        {% assign header_bg_type = 'light-background' %}
      {% endif %}
    {% endif %}
  {% else %}
    {% assign header_bg_type = 'light-background' %}
  {% endif %}

  {% if header_bg_image == nil %}
    {% assign header_bg_image = images_path | append: '/front-page-header-bg_block.jpg' %}
  {% endif %}

  {% if header_bg_image_sizes == nil %}
    {% assign header_bg_image_sizes_str = '[{"url":"' | append: images_path | append: '/front-page-header-bg.jpg", "width":1055, "height":1006}, {"url":"' | append: images_path | append: '/front-page-header-bg_block.jpg", "width":600, "height":572}]' %}
  {% else %}
    {% assign header_bg_image_sizes_str = header_bg_image_sizes | json %}
  {% endif %}

{% comment %}
  {% if header_bg_color == nil %}
    {% assign header_bg_color = 'rgba(249,205,0,1)' %}
  {% endif %}
{% endcomment %}

  {% if header_bg_color_data == nil %}
    {% assign header_bg_color_data_str = '{"r": 249, "g": 205, "b": 0, "a": 0.1, "lightness": 0.78}' %}
  {% else %}
    {% assign header_bg_color_data_str = header_bg_color_data | json %}
  {% endif %}

  {% comment %}VOOG intro popover targets. Add them where applicable popovers should appear.{% endcomment %}
  {% capture edy_intro_add_page %}{% if editmode %}data-edy-intro-popover="edy-add-page"{% endif %}{% endcapture %}
  {% capture edy_intro_add_lang %}{% if editmode %}data-edy-intro-popover="edy-add-lang"{% endif %}{% endcapture %}
  {% capture edy_intro_edit_text %}{% if editmode %}data-edy-intro-popover="edy-edit-text"{% endif %}{% endcapture %}

{% endcapture %}
