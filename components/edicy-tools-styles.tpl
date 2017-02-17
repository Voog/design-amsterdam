<style>
  {% comment %}/* Body background image */{% endcomment %}
  {% if header_bg.imageSizes != nil %}
    {% if header_bg.imageSizes == "" %}
      .header-banner {
        background-image: none;
      }
    {% else %}
      {% for imageSize in page.data.header_bg.imageSizes %}
        {% if forloop.first %}
          .header-banner {
            background-image: url("{{ imageSize.url }}");
          }
        {% elsif forloop.last %}
          {% break %}
        {% else %}
          @media screen and (max-width: {{ imageSize.width }}px) {
            .header-banner {
              background-image: url("{{ imageSize.url }}");
            }
          }
        {% endif %}
      {% endfor %}
    {% endif %}

  {% else %}
    {% assign bg_image_prefix = images_path | append: "/front-page-header-bg" %}

    .header-banner {
      background-image: url("{{ bg_image_prefix }}.jpg");
    }

    @media screen and (max-width: 1280px) {
      .header-banner {
        background-image: url("{{ bg_image_prefix }}_large.jpg");
      }
    }
  {% endif %}

  {% comment %}/* Body Background color */{% endcomment %}
  {% if header_bg.color %}
    .header-banner .background-color {
      background-color: {{ page.data.header_bg.color }};
    }
  {% endif %}
</style>
