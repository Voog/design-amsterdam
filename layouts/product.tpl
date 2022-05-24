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
    {%- assign content_default_title = "content" | lce -%}
    {%- assign content_default_title_tooltip = "content_tooltip_specific_page" | lce -%}

    <section class="content-header content-formatted cfx" data-search-indexing-allowed="true">
      {% content name="slogan" title=content_default_title title_tooltip=content_default_title_tooltip %}
    </section>
    <main class="content flex_box w-100" role="main">
      {%- if sidebar_active -%}
        {% include "sidebar-left"%}
      {%- endif -%}

      <div class="flex_col w-100">
        {% include "menu-breadcrumbs" %}
        <div class="flex_row flex_row-2 reverse-col-tablet mar_0-32-neg" data-search-indexing-allowed="true">
          <div class="flex_row-2--item-50">
            <div class="mar_0-32 p-rel js-product-page-image-wrap">
              {%- load buy_button to "buy_button" q.content.parent_id=page.id q.content.parent_type="page"
              q.content.name="body" s="content.position" -%}
              {% if buy_button.product != blank %}
                {%- assign buyButtonImage = buy_button.product.image -%}
              {% endif %}

              {%- if page.data.item_image != blank -%}
                {%- assign productImage = page.data.item_image -%}
                {%- assign isProductImage = false -%}
              {%- elsif buyButtonImage != blank -%}
                {%- assign productImage = buyButtonImage -%}
                {%- assign isProductImage = true -%}
              {%- else -%}
                {%- assign productImage = page.image -%}
                {%- assign isProductImage = false -%}
              {%- endif -%}

              {%- if productImage != blank or editmode -%}
                <div class="js-product-page-image mar_b-32">
                  {% include "content-item", _isProductImage: isProductImage, _imageData: productImage, _entityData:
                  page, _itemType: "page", _id: page.id, _targetWidth: "1280" %}
                </div>
              {%- endif -%}
            </div>
            <section class="content-formatted mar_0-32" data-search-indexing-allowed="true">
              {%- assign gallery_title = "gallery" | lce -%}
              {%- assign gallery_title_tooltip = "content_tooltip_additional_images" | lce -%}
              {% content name="gallery" title=gallery_title title_tooltip=gallery_title_tooltip %}
            </section>
          </div>

          <div class="flex_row-2--item-50">
            <div class="mar_0-32 flex_col t-sticky">
              <section class="content-formatted js-buy-btn-content"
                data-search-indexing-allowed="true">
                {% contentblock title=content_default_title title_tooltip=content_default_title_tooltip %}
                  {{ "write_product_description_here" | lc: editor_locale }}
                {% endcontentblock %}
              </section>
            </div>
          </div>
        </div>
      </div>

    </main>
    {% include "footer" %}
  </div>
  {% include "site-signout" %}
  {% include "javascripts" %}
  {% include "edicy-tools" %}
  <script>site.initCommonPage({% if editmode %}false{% else %}true{% endif %});</script>
</body>
</html>
