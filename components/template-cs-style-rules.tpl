.main {
  background-color: var(--bg-color);
}

.header,
.main-menu {
  background-color: var(--header-background-color);
}

body,
.custom-btn,
.lang-menu-btn,
.jq-select,
.search-submit,
.lang-menu-btn,
.option-btn {
  font-family: var(--font-main);
}

body,
.header .main-menu-toggler {
  color: var(--main-color);
}

.voog-search-modal-results h3,
.voog-search-modal-results a {
  color: var(--second-color);
}

.option-btn,
blockquote,
.voog-search-modal-result,
.post-header .post-date,
.post-cover .post-cover-inner .edy-img-drop-area-placeholder,
.comment .comment-info {
  color: var(--third-color);
}

.wrap {
  max-width: var(--main-width);
}

main .content.formatted,
main .content .formatted {
  background-color: var(--content-background-color);
}

@media screen and (min-width: 500px) {
  main .content.formatted,
  main .content .formatted {
    padding: var(--content-padding);
  }
}
main .content-body,
main .post-content {
  color: var(--content-color);
  font-family: var(--content-font-family);
  font-size: var(--content-font-size);
  font-style: var(--content-font-style);
  font-weight: var(--content-font-weight);
  letter-spacing: var(--content-letter-spacing);
  line-height: var(--content-line-height);
  text-align: var(--content-alignment);
  text-decoration: var(--content-text-decoration);
  text-transform: var(--content-text-transform);
}

main .content-body a,
main .post-content a,
main .footer-content a {
  color: var(--content-links-color);
  font-family: var(--content-links-font-family);
  font-style: var(--content-links-font-style);
  font-weight: var(--content-links-font-weight);
  letter-spacing: var(--content-links-letter-spacing);
  text-decoration: var(--content-links-text-decoration);
  text-transform: var(--content-links-text-transform);
}
main .content-body a:hover,
main .post-content a:hover,
main .footer-content a:hover {
  color: var(--content-links-hover-color);
  font-style: var(--content-links-hover-font-style);
  font-weight: var(--content-links-hover-font-weight);
  text-decoration: var(--content-links-hover-text-decoration);
  text-transform: var(--content-links-hover-text-transform);
}

main .content-body a,
main .post-content a {
  font-size: var(--content-links-font-size);
}
main .content-body a:hover,
main .post-content a:hover {
  font-size: var(--content-links-hover-font-size);
}

.formatted h1 {
  color: var(--h1-color);
}
.formatted h1,
.formatted h1 a,
.formatted h1 a:hover {
  font-family: var(--h1-font-family);
  font-size: var(--h1-font-size);
  font-style: var(--h1-font-style);
  font-weight: var(--h1-font-weight);
  letter-spacing: var(--h1-letter-spacing);
  line-height: var(--h1-line-height);
  padding-bottom: var(--h1-padding-bottom);
  text-align: var(--h1-alignment);
  text-decoration: var(--h1-text-decoration);
  text-transform: var(--h1-text-transform);
}
.formatted h2 {
  color: var(--h2-color);
}
.formatted h2, .formatted h2 a, .formatted h2 a:hover {
  font-family: var(--h2-font-family);
  font-size: var(--h2-font-size);
  font-style: var(--h2-font-style);
  font-weight: var(--h2-font-weight);
  letter-spacing: var(--h2-letter-spacing);
  line-height: var(--h2-line-height);
  padding-bottom: var(--h2-padding-bottom);
  text-align: var(--h2-alignment);
  text-decoration: var(--h2-text-decoration);
  text-transform: var(--h2-text-transform);
}
.formatted h3 {
  color: var(--h3-color);
}
.formatted h3,
.formatted h3 a,
.formatted h3 a:hover {
  padding-bottom: var(--h3-padding-bottom);
  font-family: var(--h3-font-family);
  font-size: var(--h3-font-size);
  font-style: var(--h3-font-style);
  font-weight: var(--h3-font-weight);
  line-height: var(--h3-line-height);
  letter-spacing: var(--h3-letter-spacing);
  text-align: var(--h3-alignment);
  text-decoration: var(--h3-text-decoration);
  text-transform: var(--h3-text-transform);
}
.formatted .custom-btn {
  padding: var(--content-button-padding);
  font-family: var(--content-button-font-family);
  font-size: var(--content-button-font-size);
  font-style: var(--content-button-font-style);
  font-weight: var(--content-button-font-weight);
  line-height: var(--content-button-line-height);
  letter-spacing: var(--content-button-letter-spacing);
  color: var(--content-button-color);
  text-decoration: var(--content-button-text-decoration);
  text-transform: var(--content-button-text-transform);
  background-color: var(--content-button-background-color);
}
.formatted .custom-btn:hover {
  font-size: var(--content-button-hover-font-size);
  font-style: var(--content-button-hover-font-style);
  font-weight: var(--content-button-hover-font-weight);
  color: var(--content-button-hover-color);
  text-decoration: var(--content-button-hover-text-decoration);
  text-transform: var(--content-button-hover-text-transform);
  background-color: var(--content-button-hover-background-color);
}

@media screen and (max-width: 500px) {
  .formatted h1 {
    font-size: calc(var(--h1-font-size) - 4px);
  }
  .formatted h2 {
    font-size: calc(var(--h2-font-size) - 2px);
  }
  .formatted h3 {
    font-size: calc(var(--h3-font-size) - 2px);
  }
}
.site-title {
  color: var(--header-site-title-color);
  font-family: var(--header-site-title-font-family);
  font-style: var(--header-site-title-font-style);
  font-weight: var(--header-site-title-font-weight);
  letter-spacing: var(--header-site-title-letter-spacing);
  text-transform: var(--header-site-title-text-transform);
}
.site-title .site-title-inner {
  text-decoration: var(--header-site-title-text-decoration);
}
.site-title a {
  color: black;
}

.main-menu ul a {
  color: var(--header-mainmenu-color);
  font-family: var(--header-mainmenu-font-family);
  font-size: var(--header-mainmenu-font-size);
  font-style: var(--header-mainmenu-font-style);
  font-weight: var(--header-mainmenu-font-weight);
  letter-spacing: var(--header-mainmenu-letter-spacing);
  text-decoration: var(--header-mainmenu-text-decoration);
  text-transform: var(--header-mainmenu-text-transform);
}
.main-menu ul a:hover {
  color: var(--header-mainmenu-hover-color);
  font-size: var(--header-mainmenu-hover-font-size);
  font-style: var(--header-mainmenu-hover-font-style);
  font-weight: var(--header-mainmenu-hover-font-weight);
  text-decoration: var(--header-mainmenu-hover-text-decoration);
  text-transform: var(--header-mainmenu-hover-text-transform);
}
.main-menu ul a.active {
  color: var(--header-mainmenu-active-color);
  font-size: var(--header-mainmenu-active-font-size);
  font-style: var(--header-mainmenu-active-font-style);
  font-weight: var(--header-mainmenu-active-font-weight);
  text-decoration: var(--header-mainmenu-active-text-decoration);
  text-transform: var(--header-mainmenu-active-text-transform);
}

.sub-menu a {
  color: var(--content-submenu--color);
  font-family: var(--content-submenu--font-family);
  font-size: var(--content-submenu--font-size);
  font-style: var(--content-submenu--font-style);
  font-weight: var(--content-submenu--font-weight);
  letter-spacing: var(--content-submenu--letter-spacing);
  text-decoration: var(--content-submenu--text-decoration);
  text-transform: var(--content-submenu--text-transform);
}
.sub-menu a:hover {
  color: var(--content-submenu--hover-color);
  font-size: var(--content-submenu--hover-font-size);
  font-style: var(--content-submenu--hover-font-style);
  font-weight: var(--content-submenu--hover-font-weight);
  text-decoration: var(--content-submenu--hover-text-decoration);
  text-transform: var(--content-submenu--hover-text-transform);
}
.sub-menu a.active {
  color: var(--content-submenu--active-color);
  font-size: var(--content-submenu--active-font-size);
  font-style: var(--content-submenu--active-font-style);
  font-weight: var(--content-submenu--active-font-weight);
  text-decoration: var(--content-submenu--active-text-decoration);
  text-transform: var(--content-submenu--active-text-transform);
}

.footer {
  background-color: var(--footer-background-color);
}
.footer .footer-content {
  color: var(--footer-color);
  font-family: var(--footer-font-family);
  font-size: var(--footer-font-size);
  font-style: var(--footer-font-style);
  font-weight: var(--footer-font-weight);
  letter-spacing: var(--footer-letter-spacing);
  line-height: var(--footer-line-height);
  text-align: var(--footer-alignment);
  text-decoration: var(--footer-text-decoration);
  text-transform: var(--footer-text-transform);
}

@media screen and (min-width: 500px) {
  .site-title {
    font-size: var(--header-site-title-font-size);
  }

  .blog-list-page .main .article,
  .blog-list-page .main .new-article {
    width: var(--blog-list-article-width);
  }
}
.blog-list-page .main .article .article-content,
.blog-list-page .main .new-article .article-content {
  text-align: var(--blog-list-alignment);
  left: var(--blog-list-padding);
  right: var(--blog-list-padding);
}
.blog-list-page .main .article h2,
.blog-list-page .main .new-article h2 {
  color: var(--blog-list-headings-color);
  font-family: var(--blog-list-headings-font-family);
  font-size: var(--blog-list-headings-font-size);
  font-style: var(--blog-list-headings-font-style);
  font-weight: var(--blog-list-headings-font-weight);
  letter-spacing: var(--blog-list-headings-letter-spacing);
  line-height: var(--blog-list-headings-line-height);
  text-decoration: var(--blog-list-headings-text-decoration);
  text-transform: var(--blog-list-headings-text-transform);
}
.blog-list-page .main .article .article-date,
.blog-list-page .main .new-article .article-date {
  color: var(--blog-list-date-color);
  font-family: var(--blog-list-date-font-family);
  font-size: var(--blog-list-date-font-size);
  font-style: var(--blog-list-date-font-style);
  font-weight: var(--blog-list-date-font-weight);
  letter-spacing: var(--blog-list-date-letter-spacing);
  padding-top: var(--blog-list-date-padding-top);
  text-decoration: var(--blog-list-date-text-decoration);
  text-transform: var(--blog-list-date-text-transform);
}

main .content table {
  background-color: var(--table-background-color);
}
main .content table td,
main .content table th {
  border: var(--table-border-width) var(--table-border-color) solid;
  padding: var(--table-cell-padding);
}

.formatted form,
.formatted .form {
  padding: var(--form-padding);
  background-color: var(--form-background-color);
}

.form_field_textfield,
.form_field_textarea,
.form_submit input,
input[type=submit],
input[type=text],
textarea {
  font-family: var(--form-field-text-font-family);
}

.form_field_textfield,
.form_field_textarea {
  background-color: var(--form-field-background-color);
  border: var(--form-field-border-width) var(--form-field-border-color) solid;
  color: var(--form-field-text-color);
  font-size: var(--form-field-text-font-size);
  line-height: var(--form-field-text-line-height);
  font-style: var(--form-field-text-font-style);
  font-weight: var(--form-field-text-font-weight);
  padding-left: var(--form-field-padding);
  padding-right: var(--form-field-padding);
  text-decoration: var(--form-field-text-text-decoration);
  text-transform: var(--form-field-text-text-transform);
}

.form_submit input,
.submit {
  padding: var(--form-button-padding);
  font-family: var(--form-button-font-family);
  font-size: var(--form-button-font-size);
  font-style: var(--form-button-font-style);
  font-weight: var(--form-button-font-weight);
  line-height: var(--form-button-line-height);
  letter-spacing: var(--form-button-letter-spacing);
  color: var(--form-button-color);
  text-decoration: var(--form-button-text-decoration);
  text-transform: var(--form-button-text-transform);
  background-color: var(--form-button-background-color);
}
.form_submit input:hover,
.submit:hover {
  font-size: var(--form-button-hover-font-size);
  font-style: var(--form-button-hover-font-style);
  font-weight: var(--form-button-hover-font-weight);
  color: var(--form-button-hover-color);
  text-decoration: var(--form-button-hover-text-decoration);
  text-transform: var(--form-button-hover-text-transform);
  background-color: var(--form-button-hover-background-color);
}

label .form_field_checkbox + .form_control_indicator::before {
  background: var(--form-field-background-color);
}
label .form_field_radio + .form_control_indicator::before {
  border-color: var(--form-field-background-color);
}
label .form_field_radio:checked + .form_control_indicator::before {
  background-color: var(--form-field-text-color);
}
