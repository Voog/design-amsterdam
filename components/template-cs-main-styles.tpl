:root {
  /* VoogStyle
     "pathI18n": ["main_styles"],
     "titleI18n": "maximum_width",
     "editor": "rangePicker",
     "min": 600,
     "max": 1800,
     "step": 20,
     "unit": "px",
     "scope": "global",
     "boundVariables": [
      "--focus-area-width"
     ]
  */
  --site-width: 940px;
  /* VoogStyle
     "pathI18n": ["main_styles"],
     "titleI18n": "font_primary",
     "editor": "listPicker",
     "list": {{ base_font_set }},
     "featured": true,
     "scope": "global"
  */
  --font-one: "Montserrat", sans-serif;
  /* VoogStyle
     "pathI18n": ["main_styles"],
     "titleI18n": "font_secondary",
     "editor": "listPicker",
     "list": {{ base_font_set }},
     "featured": true,
     "scope": "global"
  */
  --font-two: "Crimson Text", serif;
  /* VoogStyle
    "pathI18n": ["main_styles"],
    "titleI18n": "hyphens",
    "editor": "listPicker",
    "list": {{ base_hyphens_toggle_set }},
    "scope": "global",
    "boundVariables": [
      "--focus-area-hyphens",
      "--header-site-title-hyphens",
      "--header-mainmenu-hyphens",
      "--button-hyphens",
      "--blog-list-title-hyphens",
      "--content-title-hyphens",
      "--content-submenu-hyphens",
      "--content-hyphens",
      "--footer-hyphens",
      "--h1-hyphens",
      "--h2-hyphens",
      "--h3-hyphens"
    ]
  */
  --site-hyphens: auto;
  /* VoogStyle
     "pathI18n": ["main_styles", "colors"],
     "titleI18n": "primary_color",
     "editor": "colorPicker",
     "scope": "global",
     "featured": true,
     "boundVariables": [
        "--content-color",
        "--content-links-hover-color",
        "--content-submenu-hover-color",
        "--content-submenu-active-color",
        "--focus-area-links-color",
        "--footer-color",
        "--header-site-title-color",
        "--header-mainmenu-hover-color",
        "--header-mainmenu-active-color",
        "--content-title-color",
        "--blog-list-title-color",
        "--form-field-text-color",
        "--h1-color",
        "--button-color"
      ]
  */
  --color-primary: #333;
  /* VoogStyle
     "pathI18n": ["main_styles", "colors"],
     "titleI18n": "secondary_color",
     "editor": "colorPicker",
     "scope": "global",
     "featured": true,
     "boundVariables": [
        "--blog-list-date-color",
        "--content-links-color",
        "--content-submenu-color",
        "--focus-area-text-color",
        "--focus-area-links-hover-color",
        "--header-mainmenu-color",
        "--table-border-color",
        "--form-field-border-color"
     ]
  */
  --color-secondary: #919191;
  /* VoogStyle
     "pathI18n": ["main_styles", "colors"],
     "titleI18n": "background_color",
     "editor": "colorPicker",
     "scope": "global",
     "featured": true
  */
  --color-bg: rgb(255, 255, 255);
}