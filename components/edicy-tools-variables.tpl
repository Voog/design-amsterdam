{% comment %} TODO: Optimize the logic.{% endcomment %}
{% capture dont_render %}
  {% comment %}Assign language menu flags state{% endcomment %}
  {% if site.data.flags_state == nil %}
    {% assign flags_state = true %}
  {% else %}
    {% assign flags_state = site.data.flags_state %}
  {% endif %}

  {% comment %}VOOG intro popover targets. Add them where applicable popovers should appear.{% endcomment %}
  {% capture edy_intro_add_page %}{% if editmode %}data-edy-intro-popover="edy-add-page"{% endif %}{% endcapture %}
  {% capture edy_intro_add_lang %}{% if editmode %}data-edy-intro-popover="edy-add-lang"{% endif %}{% endcapture %}
  {% capture edy_intro_edit_text %}{% if editmode %}data-edy-intro-popover="edy-edit-text"{% endif %}{% endcapture %}

{% endcapture %}
