<footer class="footer content-formatted cfx">
  <div class="wrap">
    <div class="horizontal-line"></div>
    <div class="gradient-overlay"></div>

    {%- assign footer_content_title = "footer" | lce -%}
    {%- assign footer_content_title_tooltip = "content_tooltip_all_pages_same_language" | lce -%}
    {% xcontent name="footer" title=footer_content_title title_tooltip=footer_content_title_tooltip %}
  </div>

  <div class="voog-reference-wrap wrap">
    <div class="voog-reference">{% loginblock %}{% endloginblock %}</div>
  </div>
</footer>
