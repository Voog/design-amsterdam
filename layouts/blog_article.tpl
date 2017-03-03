<!DOCTYPE html>
{% include "template-variables" %}
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign blog_article = true %}
  {% include "html-head" blog_article: true %}
  {% include "edicy-tools-variables" %}
</head>

<body class="post-page content-page{% if site.search.enabled %} search-enabled{% endif %}{% if editmode or site.has_many_languages? %} lang-enabled{% endif %} {% if flags_state %}flags-enabled{% else %}flags-disabled{% endif %}">
  <div class="container">
    {% include "header" %}
    <main class="content" role="main">
      <article class="post">
        <header class="post-header content-formatted cfx">
          <h1 class="post-title" data-search-indexing-allowed="true">{% editable article.title %}</h1>
          <time class="post-date" datetime="{{ article.created_at | date : "%Y-%m-%d" }}">{{ article.created_at | format_date : "%B %d, %Y" }}</time>
        </header>
        <section class="post-content" data-search-indexing-allowed="true">
          <div class="post-excerpt content-formatted cfx" {{ edy_intro_edit_text }}>{% editable article.excerpt %}</div>
          <div class="post-body content-formatted cfx">{% editable article.body %}</div>
          <div class="post-body content-formatted cfx">{% content name="additional_body" bind="Article" %}</div>
          <div class="tags" data-search-indexing-allowed="false">
            {% include "tags-article" %}
          </div>
        </section>

        {% include "comments-article" %}
      </article>

      {% if article.older or article.newer %}
        <div class="post-nav">
          <div class="post-nav-inner">
            {% if article.older %}
              <a class="post-nav-link post-nav-link-older" href="{{ article.older.url }}">
                <div class="post-nav-link-inner">
                  <div class="post-nav-direction">{{ "previous" | lc }}</div>
                  <div class="post-nav-title">{{ article.older.title }}</div>
                </div>
              </a>
            {% endif %}

            {% if article.newer %}
              <a class="post-nav-link post-nav-link-newer" href="{{ article.newer.url }}">
                <div class="post-nav-link-inner">
                  <div class="post-nav-direction">{{ "next" | lc }}</div>
                  <div class="post-nav-title">{{ article.newer.title }}</div>
                </div>
              </a>
            {% endif %}
          </div>
        </div>
      {% endif %}
    </main>
    {% include "footer" %}
  </div>

  {% include "javascripts" %}
  {% include "edicy-tools" %}
  <script type="text/javascript">site.initArticlePage({% if editmode %}false{% else %}true{% endif %});</script>
</body>
</html>
