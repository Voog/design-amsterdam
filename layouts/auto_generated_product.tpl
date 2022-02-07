<!DOCTYPE html>
{% include "template-variables" %}
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign product_page = true %}
  {% include "html-head" product_page: true %}
  {% include "edicy-tools-variables" %}
  {% include "common-page-variables" %}
</head>

<body class="item-page product-page content-page{% if site.search.enabled %} search-enabled{% endif %}{% if editmode or site.has_many_languages? %} lang-enabled{% endif %} {% if flags_state %}flags-enabled{% else %}flags-disabled{% endif %}">
  {%- if product.image == blank -%}
    {%- assign product_image_state = "without-image" -%}
  {%- else -%}
    {%- assign product_image_state = "with-image" -%}
  {%- endif -%}

  {%- capture bottom_content_html -%}
    {%- unless editmode -%}
      {%- content bind=product name="content" -%}
    {%- endunless -%}
  {%- endcapture -%}

  {%- assign bottom_content_size = bottom_content_html | strip | size -%}

  {%- capture gallery_content_html -%}
    {%- unless editmode -%}
      {%- content bind=product name="gallery" -%}
    {%- endunless -%}
  {%- endcapture -%}

  {%- assign gallery_content_size = gallery_content_html | strip | size -%}

  <div class="container">
    {% include "header" %}
    <section class="content-header content-formatted cfx" data-search-indexing-allowed="true">
      {% content name="slogan" %}
    </section>
    <main class="content flex_box w-100" role="main">
      <div class="flex_col w-100 product-content">
        {% include "menu-breadcrumbs-sd" %}
        <div class="flex_row flex_row-2 mar_0-32-neg" data-search-indexing-allowed="true">
          <div class="flex_row-2--item-50">
            <div class="mar_0-32 p-rel">
              <div class="content-illustrations">
                <div class="content-item-box {{ product_image_state }} mar_b-32 js-content-item-box" data-item-type="page">
                  <div class="item-top">
                    {%- if product.image != blank- %}
                      <div class="top-inner aspect-ratio-inner">
                        {%- assign image_class = "item-image not-cropped" -%}
                        {% image product.image target_width: "1280" class: image_class loading: "lazy" %}
                      </div>
                    {%- endif -%}
                  </div>
                </div>
                {%- if gallery_content_size > 0 or editmode -%}
                  <section class="content-formatted js-product-gallery" data-search-indexing-allowed="true">
                    {% content bind=product name="gallery" %}
                  </section>
                {%- endif -%}
              </div>
            </div>
          </div>

          <div class="flex_row-2--item-50">
            <div class="mar_0-32 flex_col t-sticky js-product-content-right">
              <header class="content-header">
                <div class="content-formatted content-item-title" data-search-indexing-allowed="true">
                  <h1>{%- editable product.name -%}</h1>
                </div>
              </header>

              <div class="product-price">
                {%- if product.price_max_with_tax != product.price_min_with_tax -%}
                  {{ product.price_min_with_tax | money_with_currency: product.currency -}}
                  <span class="product-price-divider">–</span>
                {%- endif -%}
                {{ product.price_max_with_tax | money_with_currency: product.currency -}}
              </div>
              <section class="content-formatted" data-search-indexing-allowed="true">
               {%- if editmode or product.description != blank -%}
                 <div class="content-product-description">
                   {%- editable product.description -%}
                 </div>
               {%- endif -%}

               <div class="buy-btn-content js-buy-btn-content">
                 {% include "buy-button" %}
               </div>
               {% content bind=product %}
              </section>
            </div>
          </div>
        </div>
        {%- if bottom_content_size > 0 or editmode -%}
        <section
          class="content-product-wide content-formatted"
          data-search-indexing-allowed="true">
          {% content bind=product name="content" %}
        </section>
      {%- endif -%}
      </div>
    </main>
    {% include "footer" %}
  </div>
  {% include "site-signout" %}
  {% include "javascripts" %}
  {% include "edicy-tools" %}

  <script>
    if (site) {
      site.handleProductPageContent();
    }
  </script>
</body>
</html>
