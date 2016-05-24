{% if editmode or site.has_many_languages? %}
  <ul class="menu">
    {% for language in site.languages %}
      <li{% if language.selected? %} class="active"{% endif %}>
        <a href="{{ language.url }}" class="lang-flag lang-flag-{{ language.code }}">{{ language.title }}</a>
      </li>
    {% endfor %}

    {% if editmode %}
      <li class="add-lang-btn">{% languageadd %}</li>
    {% endif %}
  </ul>
{% endif %}

{% if editmode %}
  <div class="lang-options">
    <ul class="menu">
      <li class="menu-item">
        <button class="option-btn js-option-toggle-flags{% if flags_state %} js-flag-disable-btn{% endif %}">
          <span class="disable-text">{{ "disable_lang_flags" | lc: editor_locale }}</span>
          <span class="enable-text">{{ "enable_lang_flags" | lc: editor_locale }}</span>
        </button>
      </li>
    </ul>
  </div>
{% endif %}
