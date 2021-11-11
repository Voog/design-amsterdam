{%- comment -%}
  Product image & background picker image object have different keys
{%- endcomment -%}

{%- if _targetWidth != blank -%}
  {%- assign _maxWidth = _targetWidth | to_num -%}
  {%- assign sizes = "(min-width: " | append: _targetWidth | append: "px) " | append: _targetWidth | append: "px" -%}
{%- else -%}
  {%- assign _maxWidth = _data.width -%}
  {%- assign sizes = "100vw" -%}
{%- endif -%}

{% include "image-src-variable", _data: _data, _targetWidth: _maxWidth %}

<img class="js-lazyload {{ _className }}"
  data-src="{{ _src }}" data-sizes="{{ sizes }}" {% if _altAttr != blank %}title="{{ _altAttr | escape_once }}" alt="{{ _altAttr  | escape_once }}"{% endif %}
  {% if _src == blank %}style="display: none;"{%- endif -%}
  {% if _data[imageSizes] != blank -%}
    {%- if _data[imageSizes].size >= 1 %}
      data-srcset="
        {%- for image in _data[imageSizes] -%}
          {{ image[urlKey] }} {{ image.width }}w
          {%- unless forloop.last -%}
          ,
          {%- endunless -%}
        {%- endfor -%}
      "
    {%- endif -%}
  {%- endif -%}
/>
