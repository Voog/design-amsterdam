{% capture dont_render %}
  {% comment %}
  ===================================================================
  || Design editor variables.
  ===============================================================
  {% endcomment %}
  {% capture base_font_set %}
  [
    {
      "type": "group",
      "title": "Sans Serif",
      "list": [
        {
          "title": "Avenir Next",
          "value": "\"Avenir Next\", \"Helvetica Neue\", \"Helvetica\", \"Segoe UI\", sans-serif"
        },
        {
          "title": "Fira Sans",
          "value": "\"Fira Sans\", sans-serif"
        },
        {
          "title": "Lato",
          "value": "\"Lato\", \"Helvetica Neue\", Helvetica, Arial, sans-serif"
        },
        {
          "title": "Montserrat",
          "value": "\"Montserrat\", \"Helvetica Neue\", Helvetica, Arial, sans-serif"
        },
        {
          "title": "Open Sans",
          "value": "\"Open Sans\", sans-serif"
        },
        {
          "title": "Roboto",
          "value": "\"Roboto\", sans-serif"
        },
        {
          "title": "Source Sans Pro",
          "value": "\"Source Sans Pro\", sans-serif"
        },
        {
          "title": "Ubuntu",
          "value": "\"Ubuntu\", sans-serif"
        }
      ]
    },
    {
      "type": "group",
      "title": "Serif",
      "list": [
        {
          "title": "Arvo",
          "value": "\"Arvo\", sans-serif"
        },
        {
          "title": "Crimson Text",
          "value": "\"Crimson Text\", sans-serif"
        },
        {
          "title": "Lora",
          "value": "\"Lora\", sans-serif"
        },
        {
          "title": "Noto Serif",
          "value": "\"Noto Serif\", sans-serif"
        },
        {
          "title": "Playfair Display",
          "value": "\"Playfair Display\", sans-serif"
        },
        {
          "title": "PT Serif",
          "value": "\"PT Serif\", sans-serif"
        },
        {
          "title": "Roboto Slab",
          "value": "\"Roboto Slab\", sans-serif"
        }
      ]
    },
    {
      "type": "group",
      "title": "Monospace",
      "list": [
        {
          "title": "Anonymous Pro",
          "value": "\"Anonymous Pro\", monospace"
        },
        {
          "title": "Cousine",
          "value": "\"Cousine\", monospace"
        },
        {
          "title": "Roboto Mono",
          "value": "\"Roboto Mono\", monospace"
        },
        {
          "title": "Ubuntu Mono",
          "value": "\"Ubuntu Mono\", monospace"
        }
      ]
    }
  ]
  {% endcapture %}

  {% capture base_alignment_set %}
    [
      {
        "title": "Left",
        "value": "left"
      },
      {
        "title": "Center",
        "value": "center"
      },
      {
        "title": "Right",
        "value": "right"
      }
    ]
  {% endcapture %}


{% endcapture %}
