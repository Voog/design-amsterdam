:root {
  /* VoogStyle
     "pathI18n": ["custom_styles.header"],
     "titleI18n": "custom_styles.background_color",
     "editor": "colorPicker",
     "scope": "global"
  */
  --header-background-color: #f4f4f4;
  /* VoogStyle
     "pathI18n": ["custom_styles.header", "custom_styles.title"],
     "titleI18n": "custom_styles.font",
     "editor": "listPicker",
     "list": {{ base_font_set }},
     "featured": true,
     "scope": "global"
  */
  --header-site-title-font-family: "Montserrat", Helvetica, Arial, sans-serif;
  /* VoogStyle
     "pathI18n": ["custom_styles.header", "custom_styles.title"],
     "titleI18n": "custom_styles.letter_spacing",
     "editor": "rangePicker",
     "min": 0,
     "max": 20,
     "unit": "px",
     "scope": "global"
  */
  --header-site-title-letter-spacing: 0;
  /* VoogStyle
    "pathI18n": ["custom_styles.header", "custom_styles.title"],
    "titleI18n": "custom_styles.size",
    "type": "button",
    "editor": "rangePicker",
    "min": 8,
    "max": 80,
    "unit": "px",
    "scope": "global",
    "featured": true
  */
  --header-site-title-font-size: 24px;
  /* VoogStyle
    "pathI18n": ["custom_styles.header", "custom_styles.title"],
    "titleI18n": "custom_styles.font_weight",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "600",
      "off": "400"
    },
    "icon": "bold",
    "scope": "global"
  */
  --header-site-title-font-weight: 400;
  /* VoogStyle
    "pathI18n": ["custom_styles.header", "custom_styles.title"],
    "titleI18n": "custom_styles.font_style",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "italic",
      "off": "normal"
    },
    "icon": "italic",
    "scope": "global"
  */
  --header-site-title-font-style: normal;
  /* VoogStyle
    "pathI18n": ["custom_styles.header", "custom_styles.title"],
    "titleI18n": "custom_styles.text_decoration",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "underline",
      "off": "none"
    },
    "icon": "underline",
    "scope": "global"
  */
  --header-site-title-text-decoration: none;
  /* VoogStyle
    "pathI18n": ["custom_styles.header", "custom_styles.title"],
    "titleI18n": "custom_styles.text_transform",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "uppercase",
      "off": "none"
    },
    "icon": "uppercase",
    "scope": "global"
  */
  --header-site-title-text-transform: uppercase;
  /* VoogStyle
    "pathI18n": ["custom_styles.header", "custom_styles.title"],
    "titleI18n": "custom_styles.color",
    "type": "button",
    "editor": "colorPicker",
    "scope": "global",
    "featured": true
  */
  --header-site-title-color: black;
  /* VoogStyle
     "pathI18n": ["custom_styles.header", "custom_styles.main_menu", "custom_styles.normal"],
     "titleI18n": "custom_styles.font",
     "editor": "listPicker",
     "list": {{ base_font_set }},
     "featured": true,
     "scope": "global"
  */
  --header-mainmenu-font-family: "Montserrat", Helvetica, Arial, sans-serif;
  /* VoogStyle
     "pathI18n": ["custom_styles.header", "custom_styles.main_menu", "custom_styles.normal"],
     "titleI18n": "custom_styles.letter_spacing",
     "editor": "rangePicker",
     "min": 0,
     "max": 20,
     "unit": "px",
     "scope": "global"
  */
  --header-mainmenu-letter-spacing: 0;
  /* VoogStyle
    "pathI18n": ["custom_styles.header", "custom_styles.main_menu", "custom_styles.normal"],
    "titleI18n": "custom_styles.size",
    "type": "button",
    "editor": "rangePicker",
    "min": 8,
    "max": 80,
    "unit": "px",
    "scope": "global",
    "featured": true,
    "boundVariables": [
      "--header-mainmenu-hover-font-size",
      "--header-mainmenu-active-font-size"
    ]
  */
  --header-mainmenu-font-size: 16px;
  /* VoogStyle
    "pathI18n": ["custom_styles.header", "custom_styles.main_menu", "custom_styles.hover"],
    "titleI18n": "custom_styles.size",
    "type": "button",
    "editor": "rangePicker",
    "min": 8,
    "max": 80,
    "unit": "px",
    "scope": "global"
  */
  --header-mainmenu-hover-font-size: 16px;
  /* VoogStyle
    "pathI18n": ["custom_styles.header", "custom_styles.main_menu", "custom_styles.active"],
    "titleI18n": "custom_styles.size",
    "type": "button",
    "editor": "rangePicker",
    "min": 8,
    "max": 80,
    "unit": "px",
    "scope": "global"
  */
  --header-mainmenu-active-font-size: 16px;
  /* VoogStyle
    "pathI18n": ["custom_styles.header", "custom_styles.main_menu", "custom_styles.normal"],
    "titleI18n": "custom_styles.font_weight",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "600",
      "off": "400"
    },
    "icon": "bold",
    "scope": "global",
    "boundVariables": [
      "--header-mainmenu-hover-font-weight",
      "--header-mainmenu-active-font-weight"
    ]
  */
  --header-mainmenu-font-weight: 400;
  /* VoogStyle
    "pathI18n": ["custom_styles.header", "custom_styles.main_menu", "custom_styles.hover"],
    "titleI18n": "custom_styles.font_weight",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "600",
      "off": "400"
    },
    "icon": "bold",
    "scope": "global"
  */
  --header-mainmenu-hover-font-weight: 400;
  /* VoogStyle
    "pathI18n": ["custom_styles.header", "custom_styles.main_menu", "custom_styles.active"],
    "titleI18n": "custom_styles.font_weight",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "600",
      "off": "400"
    },
    "icon": "bold",
    "scope": "global"
  */
  --header-mainmenu-active-font-weight: 400;
  /* VoogStyle
    "pathI18n": ["custom_styles.header", "custom_styles.main_menu", "custom_styles.normal"],
    "titleI18n": "custom_styles.font_style",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "italic",
      "off": "normal"
    },
    "icon": "italic",
    "scope": "global",
    "boundVariables": [
      "--header-mainmenu-hover-font-style",
      "--header-mainmenu-active-font-style"
    ]
  */
  --header-mainmenu-font-style: normal;
  /* VoogStyle
    "pathI18n": ["custom_styles.header", "custom_styles.main_menu", "custom_styles.hover"],
    "titleI18n": "custom_styles.font_style",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "italic",
      "off": "normal"
    },
    "icon": "italic",
    "scope": "global"
  */
  --header-mainmenu-hover-font-style: normal;
  /* VoogStyle
    "pathI18n": ["custom_styles.header", "custom_styles.main_menu", "custom_styles.active"],
    "titleI18n": "custom_styles.font_style",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "italic",
      "off": "normal"
    },
    "icon": "italic",
    "scope": "global"
  */
  --header-mainmenu-active-font-style: normal;
  /* VoogStyle
    "pathI18n": ["custom_styles.header", "custom_styles.main_menu", "custom_styles.normal"],
    "titleI18n": "custom_styles.text_decoration",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "underline",
      "off": "none"
    },
    "icon": "underline",
    "scope": "global",
    "boundVariables": [
      "--header-mainmenu-hover-text-decoration",
      "--header-mainmenu-active-text-decoration"
    ]
  */
  --header-mainmenu-text-decoration: none;
  /* VoogStyle
    "pathI18n": ["custom_styles.header", "custom_styles.main_menu", "custom_styles.hover"],
    "titleI18n": "custom_styles.text_decoration",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "underline",
      "off": "none"
    },
    "icon": "underline",
    "scope": "global"
  */
  --header-mainmenu-hover-text-decoration: none;
  /* VoogStyle
    "pathI18n": ["custom_styles.header", "custom_styles.main_menu", "custom_styles.active"],
    "titleI18n": "custom_styles.text_decoration",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "underline",
      "off": "none"
    },
    "icon": "underline",
    "scope": "global"
  */
  --header-mainmenu-active-text-decoration: none;
  /* VoogStyle
    "pathI18n": ["custom_styles.header", "custom_styles.main_menu", "custom_styles.normal"],
    "titleI18n": "custom_styles.text_transform",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "uppercase",
      "off": "none"
    },
    "icon": "uppercase",
    "scope": "global",
    "boundVariables": [
      "--header-mainmenu-hover-text-transform",
      "--header-mainmenu-active-text-transform"
    ]
  */
  --header-mainmenu-text-transform: uppercase;
  /* VoogStyle
    "pathI18n": ["custom_styles.header", "custom_styles.main_menu", "custom_styles.hover"],
    "titleI18n": "custom_styles.text_transform",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "uppercase",
      "off": "none"
    },
    "icon": "uppercase",
    "scope": "global"
  */
  --header-mainmenu-hover-text-transform: uppercase;
  /* VoogStyle
    "pathI18n": ["custom_styles.header", "custom_styles.main_menu", "custom_styles.active"],
    "titleI18n": "custom_styles.text_transform",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "uppercase",
      "off": "none"
    },
    "icon": "uppercase",
    "scope": "global"
  */
  --header-mainmenu-active-text-transform: uppercase;
  /* VoogStyle
    "pathI18n": ["custom_styles.header", "custom_styles.main_menu", "custom_styles.normal"],
    "titleI18n": "custom_styles.color",
    "type": "button",
    "editor": "colorPicker",
    "scope": "global",
    "featured": true
  */
  --header-mainmenu-color: #818181;
 /* VoogStyle
  "pathI18n": ["custom_styles.header", "custom_styles.main_menu", "custom_styles.hover"],
  "titleI18n": "custom_styles.color",
  "type": "button",
  "editor": "colorPicker",
  "scope": "global"
*/
  --header-mainmenu-hover-color: black;
 /* VoogStyle
  "pathI18n": ["custom_styles.header", "custom_styles.main_menu", "custom_styles.active"],
  "titleI18n": "custom_styles.color",
  "type": "button",
  "editor": "colorPicker",
  "scope": "global"
*/
  --header-mainmenu-active-color: black;
}
