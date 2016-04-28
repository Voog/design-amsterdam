:root {
  /* VoogStyle
    "pathI18n": ["content"],
    "titleI18n": "background_color",
    "editor": "colorPicker",
    "scope": "global"
  */
  --content-background-color: rgba(255, 255, 255, 0);
  /* VoogStyle
     "pathI18n": ["content"],
     "titleI18n": "padding",
     "editor": "rangePicker",
     "min": 0,
     "max": 200,
     "unit": "px",
     "scope": "global"
  */
  --content-padding: 0;
  /* VoogStyle
     "pathI18n": ["content"],
     "titleI18n": "maximum_width",
     "editor": "rangePicker",
     "min": 250,
     "max": 1250,
     "step": 10,
     "unit": "px",
     "scope": "global"
  */
  --main-width: 700px;
  /* VoogStyle
     "pathI18n": ["content", "sub_menu", "normal"],
     "titleI18n": "font",
     "editor": "listPicker",
     "list": {{ base_font_set }},
     "featured": true,
     "scope": "global"
  */
  --content-submenu--font-family: "Montserrat", Helvetica, Arial, sans-serif;
  /* VoogStyle
     "pathI18n": ["content", "sub_menu", "normal"],
     "titleI18n": "letter_spacing",
     "editor": "rangePicker",
     "min": 0,
     "max": 20,
     "unit": "px",
     "scope": "global"
  */
  --content-submenu--letter-spacing: 0;
  /* VoogStyle
    "pathI18n": ["content", "sub_menu", "normal"],
    "titleI18n": "size",
    "type": "button",
    "editor": "rangePicker",
    "min": 8,
    "max": 80,
    "unit": "px",
    "scope": "global",
    "featured": true,
    "boundVariables": [
      "--content-submenu--hover-font-size",
      "--content-submenu--active-font-size"
    ]
  */
  --content-submenu--font-size: 14px;
  /* VoogStyle
    "pathI18n": ["content", "sub_menu", "hover"],
    "titleI18n": "size",
    "type": "button",
    "editor": "rangePicker",
    "min": 8,
    "max": 80,
    "unit": "px",
    "scope": "global"
  */
  --content-submenu--hover-font-size: 14px;
  /* VoogStyle
    "pathI18n": ["content", "sub_menu", "active"],
    "titleI18n": "size",
    "type": "button",
    "editor": "rangePicker",
    "min": 8,
    "max": 80,
    "unit": "px",
    "scope": "global"
  */
  --content-submenu--active-font-size: 14px;
  /* VoogStyle
    "pathI18n": ["content", "sub_menu", "normal"],
    "titleI18n": "font_weight",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "600",
      "off": "400"
    },
    "icon": "bold",
    "scope": "global",
    "boundVariables": [
      "--content-submenu--hover-font-weight",
      "--content-submenu--active-font-weight"
    ]
  */
  --content-submenu--font-weight: 400;
  /* VoogStyle
    "pathI18n": ["content", "sub_menu", "hover"],
    "titleI18n": "font_weight",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "600",
      "off": "400"
    },
    "icon": "bold",
    "scope": "global"
  */
  --content-submenu--hover-font-weight: 400;
  /* VoogStyle
    "pathI18n": ["content", "sub_menu", "active"],
    "titleI18n": "font_weight",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "600",
      "off": "400"
    },
    "icon": "bold",
    "scope": "global"
  */
  --content-submenu--active-font-weight: 400;
  /* VoogStyle
    "pathI18n": ["content", "sub_menu", "normal"],
    "titleI18n": "font_style",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "italic",
      "off": "normal"
    },
    "icon": "italic",
    "scope": "global",
    "boundVariables": [
      "--content-submenu--hover-font-style",
      "--content-submenu--active-font-style"
    ]
  */
  --content-submenu--font-style: normal;
  /* VoogStyle
    "pathI18n": ["content", "sub_menu", "hover"],
    "titleI18n": "font_style",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "italic",
      "off": "normal"
    },
    "icon": "italic",
    "scope": "global"
  */
  --content-submenu--hover-font-style: normal;
  /* VoogStyle
    "pathI18n": ["content", "sub_menu", "active"],
    "titleI18n": "font_style",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "italic",
      "off": "normal"
    },
    "icon": "italic",
    "scope": "global"
  */
  --content-submenu--active-font-style: normal;
  /* VoogStyle
    "pathI18n": ["content", "sub_menu", "normal"],
    "titleI18n": "text_decoration",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "underline",
      "off": "none"
    },
    "icon": "underline",
    "scope": "global",
    "boundVariables": [
      "--content-submenu--hover-text-decoration",
      "--content-submenu--active-text-decoration"
    ]
  */
  --content-submenu--text-decoration: none;
  /* VoogStyle
    "pathI18n": ["content", "sub_menu", "hover"],
    "titleI18n": "text_decoration",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "underline",
      "off": "none"
    },
    "icon": "underline",
    "scope": "global"
  */
  --content-submenu--hover-text-decoration: none;
  /* VoogStyle
    "pathI18n": ["content", "sub_menu", "active"],
    "titleI18n": "text_decoration",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "underline",
      "off": "none"
    },
    "icon": "underline",
    "scope": "global"
  */
  --content-submenu--active-text-decoration: none;
  /* VoogStyle
    "pathI18n": ["content", "sub_menu", "normal"],
    "titleI18n": "text_transform",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "uppercase",
      "off": "none"
    },
    "icon": "uppercase",
    "scope": "global",
    "boundVariables": [
      "--content-submenu--hover-text-transform",
      "--content-submenu--active-text-transform"
    ]
  */
  --content-submenu--text-transform: none;
  /* VoogStyle
    "pathI18n": ["content", "sub_menu", "hover"],
    "titleI18n": "text_transform",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "uppercase",
      "off": "none"
    },
    "icon": "uppercase",
    "scope": "global"
  */
  --content-submenu--hover-text-transform: none;
  /* VoogStyle
    "pathI18n": ["content", "sub_menu", "active"],
    "titleI18n": "text_transform",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "uppercase",
      "off": "none"
    },
    "icon": "uppercase",
    "scope": "global"
  */
  --content-submenu--active-text-transform: none;
  /* VoogStyle
    "pathI18n": ["content", "sub_menu", "normal"],
    "titleI18n": "color",
    "type": "button",
    "editor": "colorPicker",
    "scope": "global",
    "featured": true
  */
  --content-submenu--color: #818181;
 /* VoogStyle
  "pathI18n": ["content", "sub_menu", "hover"],
  "titleI18n": "color",
  "type": "button",
  "editor": "colorPicker",
  "scope": "global"
*/
  --content-submenu--hover-color: black;
 /* VoogStyle
  "pathI18n": ["content", "sub_menu", "active"],
  "titleI18n": "color",
  "type": "button",
  "editor": "colorPicker",
  "scope": "global"
*/
  --content-submenu--active-color: black;
  /* VoogStyle
     "pathI18n": ["content", "text"],
     "titleI18n": "font",
     "editor": "listPicker",
     "list": {{ base_font_set }},
     "featured": true,
     "scope": "global",
     "boundVariables": [
       "--form-field-text-font-family"
     ]
  */
  --content-font-family: "Montserrat", Helvetica, Arial, sans-serif;
  /* VoogStyle
     "pathI18n": ["content", "text"],
     "titleI18n": "alignment",
     "editor": "listPicker",
     "list": {{ base_alignment_set }},
     "scope": "global"
  */
  --content-alignment: left;
  /* VoogStyle
     "pathI18n": ["content", "text"],
     "titleI18n": "letter_spacing",
     "editor": "rangePicker",
     "min": 0,
     "max": 40,
     "unit": "px",
     "scope": "global"
  */
  --content-letter-spacing: 0;
  /* VoogStyle
     "pathI18n": ["content", "text"],
     "titleI18n": "line_height",
     "editor": "rangePicker",
     "min": 0.8,
     "max": 3,
     "step": 0.1,
     "unit": "em",
     "scope": "global"
  */
  --content-line-height: 1.45 #em;
  /* VoogStyle
    "pathI18n": ["content", "text"],
    "titleI18n": "size",
    "type": "button",
    "editor": "rangePicker",
    "min": 8,
    "max": 80,
    "unit": "px",
    "scope": "global",
    "featured": true,
    "boundVariables": [
      "--form-field-text-font-size",
      "--content-links-font-size"
    ]
  */
  --content-font-size: 18px;
  /* VoogStyle
    "pathI18n": ["content", "text"],
    "titleI18n": "font_weight",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "600",
      "off": "400"
    },
    "icon": "bold",
    "scope": "global"
  */
  --content-font-weight: 400;
  /* VoogStyle
    "pathI18n": ["content", "text"],
    "titleI18n": "font_style",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "italic",
      "off": "normal"
    },
    "icon": "italic",
    "scope": "global"
  */
  --content-font-style: normal;
  /* VoogStyle
    "pathI18n": ["content", "text"],
    "titleI18n": "text_decoration",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "underline",
      "off": "none"
    },
    "icon": "underline",
    "scope": "global"
  */
  --content-text-decoration: none;
  /* VoogStyle
    "pathI18n": ["content", "text"],
    "titleI18n": "text_transform",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "uppercase",
      "off": "none"
    },
    "icon": "uppercase",
    "scope": "global"
  */
  --content-text-transform: none;
  /* VoogStyle
    "pathI18n": ["content", "text"],
    "titleI18n": "color",
    "type": "button",
    "editor": "colorPicker",
    "scope": "global",
    "featured": true
  */
  --content-color: #333;
  /* VoogStyle
    "pathI18n": ["content", "link", "normal"],
    "titleI18n": "size",
    "type": "button",
    "editor": "rangePicker",
    "min": 8,
    "max": 80,
    "unit": "px",
    "scope": "global",
    "boundVariables": [
      "--content-links-hover-font-size"
    ]
  */
  --content-links-font-size: 18px;
  /* VoogStyle
    "pathI18n": ["content", "link", "hover"],
    "titleI18n": "size",
    "type": "button",
    "editor": "rangePicker",
    "min": 8,
    "max": 80,
    "unit": "px",
    "scope": "global"
  */
  --content-links-hover-font-size: 18px;
  /* VoogStyle
    "pathI18n": ["content", "link", "normal"],
    "titleI18n": "font_weight",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "600",
      "off": "400"
    },
    "icon": "bold",
    "scope": "global",
    "boundVariables": [
      "--content-links-hover-font-weight"
    ]
  */
  --content-links-font-weight: 400;
  /* VoogStyle
    "pathI18n": ["content", "link", "hover"],
    "titleI18n": "font_weight",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "600",
      "off": "400"
    },
    "icon": "bold",
    "scope": "global"
  */
  --content-links-hover-font-weight: 400;
  /* VoogStyle
    "pathI18n": ["content", "link", "normal"],
    "titleI18n": "font_style",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "italic",
      "off": "normal"
    },
    "icon": "italic",
    "scope": "global",
    "boundVariables": [
      "--content-links-hover-font-style"
    ]
  */
  --content-links-font-style: normal;
  /* VoogStyle
    "pathI18n": ["content", "link", "hover"],
    "titleI18n": "font_style",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "italic",
      "off": "normal"
    },
    "icon": "italic",
    "scope": "global"
  */
  --content-links-hover-font-style: normal;
  /* VoogStyle
    "pathI18n": ["content", "link", "normal"],
    "titleI18n": "text_decoration",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "underline",
      "off": "none"
    },
    "icon": "underline",
    "scope": "global",
    "boundVariables": [
      "--content-links-hover-text-decoration"
    ]
  */
  --content-links-text-decoration: none;
  /* VoogStyle
    "pathI18n": ["content", "link", "hover"],
    "titleI18n": "text_decoration",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "underline",
      "off": "none"
    },
    "icon": "underline",
    "scope": "global"
  */
  --content-links-hover-text-decoration: none;
  /* VoogStyle
    "pathI18n": ["content", "link", "normal"],
    "titleI18n": "text_transform",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "uppercase",
      "off": "none"
    },
    "icon": "uppercase",
    "scope": "global",
    "boundVariables": [
      "--content-links-hover-text-transform"
    ]
  */
  --content-links-text-transform: none;
  /* VoogStyle
    "pathI18n": ["content", "link", "hover"],
    "titleI18n": "text_transform",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "uppercase",
      "off": "none"
    },
    "icon": "uppercase",
    "scope": "global"
  */
  --content-links-hover-text-transform: none;
  /* VoogStyle
    "pathI18n": ["content", "link", "normal"],
    "titleI18n": "color",
    "type": "button",
    "editor": "colorPicker",
    "scope": "global",
    "featured": true
  */
  --content-links-color: #818181;
 /* VoogStyle
  "pathI18n": ["content", "link", "hover"],
  "titleI18n": "color",
  "type": "button",
  "editor": "colorPicker",
  "scope": "global"
*/
  --content-links-hover-color: black;
  /* VoogStyle
    "pathI18n": ["content", "button", "normal"],
    "titleI18n": "padding",
    "editor": "rangePicker",
    "min": 0,
    "max": 200,
    "step": 1,
    "unit": "px",
    "scope": "global"
  */
  --content-button-padding: 12px;
  /* VoogStyle
    "pathI18n": ["content", "button", "normal"],
    "titleI18n": "font",
    "editor": "listPicker",
    "list": {{ base_font_set }},
    "featured": true,
    "scope": "global"
  */
  --content-button-font-family: "Montserrat", Helvetica, Arial, sans-serif;
  /* VoogStyle
    "pathI18n": ["content", "button", "normal"],
    "titleI18n": "letter_spacing",
    "editor": "rangePicker",
    "min": 0,
    "max": 5,
    "step": 0.1,
    "unit": "em",
    "scope": "global"
  */
  --content-button-letter-spacing: 0;
  /* VoogStyle
    "pathI18n": ["content", "button", "normal"],
    "titleI18n": "line_height",
    "editor": "rangePicker",
    "min": 1,
    "max": 5,
    "step": 0.1,
    "unit": "",
    "scope": "global"
  */
  --content-button-line-height: 1.2;
  /* VoogStyle
    "pathI18n": ["content", "button", "normal"],
    "titleI18n": "background_color",
    "editor": "colorPicker",
    "scope": "global",
    "boundVariables": [
      "--content-button-hover-background-color"
    ]
  */
  --content-button-background-color: #2b2b2b;
  /* VoogStyle
    "pathI18n": ["content", "button", "hover"],
    "titleI18n": "background_color",
    "editor": "colorPicker",
    "scope": "global"
  */
  --content-button-hover-background-color: rgba(43, 43, 43, 0.8);
  /* VoogStyle
    "pathI18n": ["content", "button", "normal"],
    "titleI18n": "size",
    "type": "button",
    "editor": "rangePicker",
    "min": 8,
    "max": 80,
    "unit": "px",
    "featured": true,
    "scope": "global",
    "boundVariables": [
      "--content-button-hover-font-size"
    ]
  */
  --content-button-font-size: 18px;
  /* VoogStyle
    "pathI18n": ["content", "button", "hover"],
    "titleI18n": "size",
    "type": "button",
    "editor": "rangePicker",
    "min": 8,
    "max": 80,
    "unit": "px",
    "scope": "global"
  */
  --content-button-hover-font-size: 18px;
  /* VoogStyle
    "pathI18n": ["content", "button", "normal"],
    "titleI18n": "font_size",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "600",
      "off": "400"
    },
    "icon": "bold",
    "scope": "global",
    "boundVariables": [
      "--content-button-hover-font-weight"
    ]
  */
  --content-button-font-weight: 400;
  /* VoogStyle
    "pathI18n": ["content", "button", "hover"],
    "titleI18n": "font_size",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "600",
      "off": "400"
    },
    "icon": "bold",
    "scope": "global"
  */
  --content-button-hover-font-weight: 400;
  /* VoogStyle
    "pathI18n": ["content", "button", "normal"],
    "titleI18n": "font_style",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "italic",
      "off": "normal"
    },
    "icon": "italic",
    "scope": "global",
    "boundVariables": [
      "--content-button-hover-font-style"
    ]
  */
  --content-button-font-style: normal;
  /* VoogStyle
    "pathI18n": ["content", "button", "hover"],
    "titleI18n": "font_style",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "italic",
      "off": "normal"
    },
    "icon": "italic",
    "scope": "global"
  */
  --content-button-hover-font-style: normal;
  /* VoogStyle
    "pathI18n": ["content", "button", "normal"],
    "titleI18n": "text_decoration",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "underline",
      "off": "none"
    },
    "icon": "underline",
    "scope": "global",
    "boundVariables": [
      "--content-button-hover-text-decoration"
    ]
  */
  --content-button-text-decoration: none;
  /* VoogStyle
    "pathI18n": ["content", "button", "hover"],
    "titleI18n": "text_decoration",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "underline",
      "off": "none"
    },
    "icon": "underline",
    "scope": "global"
  */
  --content-button-hover-text-decoration: none;
  /* VoogStyle
    "pathI18n": ["content", "button", "normal"],
    "titleI18n": "text_transform",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "uppercase",
      "off": "none"
    },
    "icon": "uppercase",
    "scope": "global",
    "boundVariables": [
      "--content-button-hover-text-transform"
    ]
  */
  --content-button-text-transform: none;
  /* VoogStyle
    "pathI18n": ["content", "button", "hover"],
    "titleI18n": "text_transform",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "uppercase",
      "off": "none"
    },
    "icon": "uppercase",
    "scope": "global"
  */
  --content-button-hover-text-transform: none;
  /* VoogStyle
    "pathI18n": ["content", "button", "normal"],
    "titleI18n": "color",
    "type": "button",
    "editor": "colorPicker",
    "featured": true,
    "scope": "global",
    "boundVariables": [
      "--content-button-hover-color"
    ]
  */
  --content-button-color: white;
  /* VoogStyle
    "pathI18n": ["content", "button", "hover"],
    "titleI18n": "color",
    "type": "button",
    "editor": "colorPicker",
    "scope": "global"
  */
  --content-button-hover-color: white;
}
