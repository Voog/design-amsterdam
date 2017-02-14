{% if site.search.enabled %}
  <div class="search js-search js-popover cfx">
    <form id="search" class="search-form js-search-form cfx" method="get" action="#">
      <input id="onpage_search" class="search-input js-search-input" type="text" name="" placeholder="{{ 'search_this_site' | lc }}">

      <div class="search-btn search-btn-reset js-search-reset">
        <svg version="1.1" baseProfile="full" height="12px" width="12px" viewBox="0 0 24 24">
          <path d="M13.8,11.4 C13.8,11.4 22.2,19.8 22.2,19.8 C22.8,20.4 22.8,21.5 22.2,22.2 C21.5,22.8 20.4,22.8 19.8,22.2 C19.8,22.2 11.4,13.8 11.4,13.8 C11.4,13.8 3.1,22.2 3.1,22.2 C2.4,22.8 1.3,22.8 0.7,22.2 C0,21.5 0,20.4 0.7,19.8 C0.7,19.8 9,11.4 9,11.4 C9,11.4 0.7,3.1 0.7,3.1 C0,2.4 0,1.3 0.7,0.7 C1.3,0 2.4,0 3.1,0.7 C3.1,0.7 11.4,9 11.4,9 C11.4,9 19.8,0.7 19.8,0.7 C20.4,0 21.5,0 22.2,0.7 C22.8,1.3 22.8,2.4 22.2,3.1 C22.2,3.1 13.8,11.4 13.8,11.4 Z"></path>
        </svg>
      </div>
    </form>

    <button class="search-btn search-btn-open js-search-open">
      <svg width="18px" height="18px" viewbox="0 0 36 36" xmlns="http://www.w3.org/2000/svg">
        <path d="M35.1,30.6 C35.1,30.6 27.3,22.8 27.3,22.8 C28.8,20.5 29.6,17.8 29.6,14.8 C29.6,6.6 23,0 14.8,0 C6.6,0 0,6.6 0,14.8 C0,23 6.6,29.6 14.8,29.6 C17.8,29.6 20.5,28.8 22.8,27.3 C22.8,27.3 30.6,35.1 30.6,35.1 C31.2,35.7 32,36 32.8,36 C33.6,36 34.4,35.7 35.1,35.1 C36.3,33.8 36.3,31.8 35.1,30.6 ZM4.2,14.8 C4.2,9 9,4.2 14.8,4.2 C20.7,4.2 25.4,9 25.4,14.8 C25.4,20.7 20.7,25.4 14.8,25.4 C9,25.4 4.2,20.7 4.2,14.8 Z"></path>
      </svg>
    </button>

    <div class="voog-search-modal-inner js-voog-search-modal-inner"></div>
  </div>
{% endif %}
