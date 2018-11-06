{% unless article.new_record? %}
  <aside class="comments cfx{% if show_article_comments == false %} hide-article-comments{% endif %}">
    <h2 class="comments-title">{{ 'replies' | lcc : article.comments_count }}</h2>

    {% include "comment-form" %}

    {% for comment in article.comments %}
      <div class="comment edy-site-blog-comment">
        <div class="comment-header">
          <span class="comment-author">{{ comment.author }}</span>
          <span class="comment-date">{{ comment.created_at | format_date : "%b %d, %Y" }}</span>
          <span>{% removebutton %}</span>
        </div>
        <div class="comment-body">{{ comment.body_html }}</div>
      </div>
    {% endfor %}
  </aside>
{% endunless %}
