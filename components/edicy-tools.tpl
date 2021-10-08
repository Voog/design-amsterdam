{% editorjsblock %}
  <script src='{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js'></script>
  <script>
    var siteData = new Edicy.CustomData({
      type: 'site'
    });

    var pageData = new Edicy.CustomData({
      type: 'page',
      id: '{{ page.id }}'
    });

    // Initiates language flag toggleing functionality.
    site.toggleFlags();

    // Front page left content area background picker.
    var headerBg = new Edicy.BgPicker($('.js-background-settings'), {
        picture: true,
        target_width: 600,
        color: true,
        showAlpha: true,

      preview: function(data) {
        site.headerBgPreview(data, '.js-header-banner');
      },

      commit: function(data) {
        site.headerBgCommit(data, 'header_bg');
      }
    });

    site.bindCustomTexteditorStyles('{{ "button" | lc: editor_locale }}');

    {%- if page.layout_title == product_layout -%}
      {%- assign dropAreaPlaceholder = "drag_picture_for_product_here" | lce | escape -%}
      site.bindProductListeners("{{ dropAreaPlaceholder }}", {{ page.id }});
    {%- else -%}
      {%- assign dropAreaPlaceholder = "drag_picture_here" | lce | escape -%}

      {% if site.data.settings_root_item %}
        rootItemValuesObj = {{ site.data.settings_root_item | json }};
      {% else %}
        rootItemValuesObj = {};
      {% endif %}

      template.bindRootItemSettings(rootItemValuesObj);
    {%- endif -%}

    site.bindContentItemImgDropAreas('{{ dropAreaPlaceholder }}', "item_image", "image_crop_state");
    site.bindContentItemImageCropToggle("image_crop_state");
  </script>
{% endeditorjsblock %}
