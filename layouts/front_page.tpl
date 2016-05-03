<!DOCTYPE html>
{% include "template-variables" %}
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign blog_list = true %}
  {% assign front_page = true %}
  {% include "html-head" blog_list: true, front_page: true %}
  {% include "edicy-tools-variables" %}
</head>

<body class="front-page blog-page{% if site.search.enabled %} search-enabled{% endif %}">
  <div class="container">
    {% include "header" %}
    <main class="content" role="main">
      <section class="content-body content-formatted" data-search-indexing-allowed="true">{% content %}</section>
      {% for article in site.latest_articles %}
        <article class="post">
          <header class="post-header">
            <h1 class="post-title"><a href="{{ article.url }}">{{ article.title }}</a></h1>
            <time datetime="{{ article.created_at | date : "%Y-%m-%d" }}" class="post-date">{{ article.created_at | date : "%b %d, %Y" }}</time>
          </header>

          <section class="post-content">
            <div class="post-excerpt content-formatted cfx">{{ article.excerpt }}</div>
          </section>
        </article>
      {% endfor %}
    </main>
    {% include "footer" %}
  </div>
  {% include "javascripts" %}
  {% include "edicy-tools" %}
  <script>site.initFrontPage({% if editmode %}false{% else %}true{% endif %});</script>
</body>
</html>
