<script src="{{ javascripts_path }}/application.min.js"></script>
{% sitejs_include %}
{% editorjsblock %}
<script src='{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js'></script>
{% endeditorjsblock %}
{% if site.search.enabled %}
<script src="{{ site.static_asset_host }}/libs/edicy-search/latest/edicy-search.js"></script>
<script src="{{ javascripts_path }}/search.min.js"></script>
<script>
  $(function() {
    var search = new VoogSearch($('.js-search-form'), {
      per_page: 3,
      lang: '{{ page.language_code }}',
      noResults: '{{ "search_noresults"|lc }}',
      minChars: 2,
      searchOnType: true
    });

    var mobilesearch = new VoogSearch($('.js-mobile-search-form'), {
      per_page: 3,
      lang: '{{ page.language_code }}',
      noResults: '{{ "search_noresults"|lc }}',
      $parent: $('#mobile-search-results'),
      visibleClass: 'voog-mobile-search-visible',
      closeOnSideClick: false
    });

    $('.mobile-search-toggler').click(function(event) {
        event.preventDefault();
        var $body = $('body');
        if ($body.hasClass('mobilesearch-open')) {
            $body.removeClass('mobilesearch-open');
            mobilesearch.reset();
        }
        else {
            $('body').addClass('mobilesearch-open');
            $('#mobile-search .search-input').get(0).focus();
        }

    });
  });
</script>
{% endif %}

{% unless editmode %}{{ site.analytics }}{% endunless %}
