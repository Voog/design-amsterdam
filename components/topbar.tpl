<section class="topbar">
  <nav class="mobile-menu lang-menu js-menu-lang-wrap {% if flags_state %}flags-enabled{% else %}flags-disabled{% endif %}">
    {% include "lang-menu" %}
  </nav>

  {% if site.search.enabled %}<a href="#" class="mobile-search-toggler"></a>
  <div id="mobile-search">
    <form class="search js-mobile-search-form">
      <div class="search-box">
        <input type="text" class="search-input" placeholder="{{ "search"|lc }}" />
        <a class="search-submit js-search-submit"></a>
      </div>
    </form>
    <div id="mobile-search-results"></div>
  </div>
  {% endif %}

  <button class="toggle-btn js-menu-toggle">
    <div class="toggle-stripe"></div>
    <div class="toggle-stripe"></div>
    <div class="toggle-stripe"></div>
    <div class="close-icon">
      <svg height="18" width="18" viewbox="0 0 23 23">
        <path opacity="1.0" fill="rgb( 255, 255, 255 )"
       d="M13.834,11.4200000000001 C13.834,11.4200000000001 22.172,19.758 22.172,19.758 C22.839,20.425 22.839,21.5050000000001 22.172,22.172 C21.506,22.838 20.425,22.8389999999999 19.758,22.172 C19.758,22.172 11.42,13.8340000000001 11.42,13.8340000000001 C11.42,13.8340000000001 3.08199999999999,22.172 3.08199999999999,22.172 C2.41499999999996,22.8389999999999 1.334,22.838 0.66799999999995,22.172 C0.00099999999998,21.5050000000001 0,20.425 0.66799999999995,19.758 C0.66799999999995,19.758 9.00599999999997,11.4200000000001 9.00599999999997,11.4200000000001 C9.00599999999997,11.4200000000001 0.66799999999995,3.08200000000011 0.66799999999995,3.08200000000011 C0.00099999999998,2.41499999999996 0.00099999999998,1.33400000000006 0.66799999999995,0.66800000000012 C1.334,0.00099999999998 2.41499999999996,0 3.08199999999999,0.66800000000012 C3.08199999999999,0.66800000000012 11.42,9.00500000000011 11.42,9.00500000000011 C11.42,9.00500000000011 19.758,0.66800000000012 19.758,0.66800000000012 C20.425,0 21.505,0.00099999999998 22.172,0.66800000000012 C22.838,1.33400000000006 22.839,2.41499999999996 22.172,3.08200000000011 C22.172,3.08200000000011 13.834,11.4200000000001 13.834,11.4200000000001 Z "/>
      </svg>
    </div>
  </button>
  <nav class="mobile-menu main-menu">
    {% include "nav-menu" with "mobile-menu" %}
  </nav>
</section>
