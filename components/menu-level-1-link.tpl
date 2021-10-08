<li class="menu-item{% if item.selected? %} active{% endif %} js-prevent-link-click{% if render_hidden_categories == true and item.layout_title == product_list_layout or item.layout_title == product_layout %}{% unless show_product_related_pages_in_main_menu %} is-hidden{% endunless %} js-menu-item-products{% endif %}">
  <a {% unless item.translated? %}class="fci-editor-menuadd untranslated"{% endunless %} href="{{ item.url }}">{{ item.title }}</a>
</li>
