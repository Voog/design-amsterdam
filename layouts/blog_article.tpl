<!DOCTYPE html>
{% include "template-variables" %}
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign blog_article = true %}
  {% include "html-head" blog_article: true %}
  {% include "edicy-tools-variables" %}
</head>

<body class="post-page{% if site.search.enabled %} search-enabled{% endif %}{% if editmode %} editmode{% endif %}">
  <div class="container">
    {% include "header" %}
    <main class="content" role="main">
      <article class="post">
        <header class="post-header content-formatted cfx">
          <h1 class="post-title" data-search-indexing-allowed="true">{% editable article.title %}</h1>
          <time class="post-date" datetime="{{ article.created_at | date : "%Y-%m-%d" }}">{{ article.created_at | format_date : "%B %d, %Y" }}</time>
        </header>
        <section class="post-content" data-search-indexing-allowed="true">
          <div class="post-excerpt content-formatted cfx">{% editable article.excerpt %}</div>
          <div class="post-body content-formatted cfx">{% editable article.body %}</div>
          <div class="tags" data-search-indexing-allowed="false">
            {% include "tags-article" %}
          </div>
        </section>

        {% include "comments-article" %}
      </article>

    </main>
    {% include "footer" %}
  </div>

  {% include "javascripts" %}
  {% include "edicy-tools" %}
  <script type="text/javascript">site.initArticlePage({% if editmode %}false{% else %}true{% endif %});</script>
</body>
</html>
