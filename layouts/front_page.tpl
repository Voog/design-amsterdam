<!DOCTYPE html>
{%- include "template-settings" -%}
{%- include "template-variables" -%}
{%- include "blog-article-variables" -%}
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign blog_list = true %}
  {% include "html-head" blog_list: true %}
  {% include "edicy-tools-variables" %}
</head>

<body class="blog-page content-page {% if site.search.enabled %} search-enabled{% endif %}{% if editmode or site.has_many_languages? %} lang-enabled{% endif %} {% if flags_state %}flags-enabled{% else %}flags-disabled{% endif %}">
  <div class="container" data-search-indexing-allowed="false">
    {% include "header" %}
    <main class="content" role="main">
      <section class="content-body content-formatted" data-search-indexing-allowed="true" {{ edy_intro_edit_text }}>{% content %}</section>
      {% if editmode %}
        <div class="settings-editor-wrap">
          {% include "blog-settings-editor" %}
        </div>
      {% endif %}
      {% for article in site.latest_articles %}
      {% include "blog-settings-variables" %}
        <article class="post">
          <header class="post-header">
            <h1 class="post-title"><a href="{{ article.url }}">{{ article.title }}</a></h1>

            {% assign article_year = article.created_at | format_date: "%Y" | to_num %}
            {% if article_year == current_year %}
              {% assign article_date_format = "long_without_year" %}
            {% else %}
              {% assign article_date_format = "long" %}
            {% endif %}
            
            {% if editmode or show_article_date != false %}
              <time class="post-date{% if article_data_show_date_defined != true %} site-data{% endif %}{% if show_article_date == false %} hide-article-date{% endif %}" datetime="{{ article.created_at | date: '%Y-%m-%d' }}">{{ article.created_at | format_date: article_date_format }}</time>
            {% endif %}
          </header>

          <section class="post-content">
            <div class="post-excerpt content-formatted cfx">{{ article.excerpt }}</div>
            <div class="post-body content-formatted cfx">{{ article.body }}</div>
            <div class="post-readmore"><a class="post-read-more-btn" href="{{ article.url }}">{{ "read_more" | lc }}</a></div>
          </section>
        </article>
      {% endfor %}
    </main>
    {% include "footer" %}
  </div>
  {% include "site-signout" %}
  {% include "javascripts" %}
  {% include "edicy-tools" %}
  <script type="text/javascript">site.initBlogPage({% if editmode %}false{% else %}true{% endif %});</script>
</body>
</html>
