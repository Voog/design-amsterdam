body {
  background-color: var(--color-bg);
  font-family: var(--font-two);
}

.post-header,
.tags,
.post-page .tags,
.comments,
.comment-form input,
.comment-form textarea,
.footer,
.voog-reference,
.front-page .content-body,
.common-page .content-header,
.header,
.menu,
.lang-menu-toggle,
.search .search-input,
.voog-search-result,
.sidebar,
.sidebar-left .content-formatted h1 {
  font-family: var(--font-one);
}

.content-formatted h1,
.content-formatted h2,
.content-formatted h3,
.content-formatted h4,
.content-formatted h5,
.content-formatted h6,
.content-formatted form,
.content-formatted .form,
.content-formatted form input,
.content-formatted form-textarea {
  font-family: var(--font-one);
}

@media screen and (max-width: 640px) {
  .topbar {
    font-family: var(--font-one);
  }
}
.container,
.header .header-inner {
  max-width: var(--site-width);
}

.header .header-inner .header-title, .header .header-inner .header-title a, .header .header-inner .header-title a:hover {
  color: var(--header-site-title-color);
  font-size: var(--header-site-title-font-size);
  font-style: var(--header-site-title-font-style);
  font-weight: var(--header-site-title-font-weight);
  line-height: var(--header-site-title-line-height);
  text-decoration: var(--header-site-title-text-decoration);
  text-transform: var(--header-site-title-text-transform);
}

.main-menu li a {
  color: var(--header-mainmenu-color);
  font-size: var(--header-mainmenu-font-size);
  font-style: var(--header-mainmenu-font-style);
  font-weight: var(--header-mainmenu-font-weight);
  line-height: var(--header-mainmenu-line-height);
  text-decoration: var(--header-mainmenu-text-decoration);
  text-transform: var(--header-mainmenu-text-transform);
}
.main-menu li a:hover,
.main-menu li.active a:hover {
  color: var(--header-mainmenu-hover-color);
  font-style: var(--header-mainmenu-hover-font-style);
  font-weight: var(--header-mainmenu-hover-font-weight);
  text-decoration: var(--header-mainmenu-hover-text-decoration);
  text-transform: var(--header-mainmenu-hover-text-transform);
}
.main-menu li.active a {
  color: var(--header-mainmenu-active-color);
  font-style: var(--header-mainmenu-active-font-style);
  font-weight: var(--header-mainmenu-active-font-weight);
  text-decoration: var(--header-mainmenu-active-text-decoration);
  text-transform: var(--header-mainmenu-active-text-transform);
}

.common-page .content-header,
.post-page .post-header h1 {
  font-size: var(--content-title-font-size);
  line-height: var(--content-title-line-height);
  font-weight: var(--content-title-font-weight);
  font-style: var(--content-title-font-style);
  text-decoration: var(--content-title-text-decoration);
  text-transform: var(--content-title-text-transform);
  color: var(--content-title-color);
}

.sub-menu li a {
  color: var(--content-submenu-color);
  font-size: var(--content-submenu-font-size);
  font-style: var(--content-submenu-font-style);
  font-weight: var(--content-submenu-font-weight);
  line-height: var(--content-submenu-line-height);
  text-decoration: var(--content-submenu-text-decoration);
  text-transform: var(--content-submenu-text-transform);
}
.sub-menu li a:hover,
.sub-menu li.active a:hover {
  color: var(--content-submenu-hover-color);
  font-style: var(--content-submenu-hover-font-style);
  font-weight: var(--content-submenu-hover-font-weight);
  line-height: var(--content-submenu-line-height);
  text-decoration: var(--content-submenu-hover-text-decoration);
  text-transform: var(--content-submenu-hover-text-transform);
}
.sub-menu li.active a {
  color: var(--content-submenu-active-color);
  font-style: var(--content-submenu-active-font-style);
  font-weight: var(--content-submenu-active-font-weight);
  line-height: var(--content-submenu-line-height);
  text-decoration: var(--content-submenu-active-text-decoration);
  text-transform: var(--content-submenu-active-text-transform);
}
.sub-menu li.active a:hover {
  text-transform: var(--content-submenu-active-text-transform);
}

.content-formatted {
  font-size: var(--content-font-size);
  line-height: var(--content-line-height);
  color: var(--content-color);
}
.content-formatted a {
  color: var(--content-links-color);
}
.content-formatted a:hover {
  color: var(--content-links-hover-color);
}

.footer {
  color: var(--footer-color);
  font-size: var(--footer-font-size);
  font-style: var(--footer-font-style);
  font-weight: var(--footer-font-weight);
  line-height: var(--footer-line-height);
  text-decoration: var(--footer-text-decoration);
  text-transform: var(--footer-text-transform);
}

.content-formatted h1 {
  color: var(--h1-color);
}
.content-formatted h1,
.content-formatted h1 a,
.content-formatted h1 a:hover {
  font-size: var(--h1-font-size);
  font-style: var(--h1-font-style);
  font-weight: var(--h1-font-weight);
  line-height: var(--h1-line-height);
  text-align: var(--h1-alignment);
  text-decoration: var(--h1-text-decoration);
  text-transform: var(--h1-text-transform);
}
.content-formatted h2 {
  color: var(--h2-color);
}
.content-formatted h2, .content-formatted h2 a, .content-formatted h2 a:hover {
  font-size: var(--h2-font-size);
  font-style: var(--h2-font-style);
  font-weight: var(--h2-font-weight);
  line-height: var(--h2-line-height);
  text-align: var(--h2-alignment);
  text-decoration: var(--h2-text-decoration);
  text-transform: var(--h2-text-transform);
}
.content-formatted h3 {
  color: var(--h3-color);
}
.content-formatted h3,
.content-formatted h3 a,
.content-formatted h3 a:hover {
  font-size: var(--h3-font-size);
  font-style: var(--h3-font-style);
  font-weight: var(--h3-font-weight);
  line-height: var(--h3-line-height);
  text-align: var(--h3-alignment);
  text-decoration: var(--h3-text-decoration);
  text-transform: var(--h3-text-transform);
}

.content-formatted .custom-btn,
.content-formatted .custom-btn:hover,
.content-formatted .form_submit input,
.content-formatted .form_submit input:hover {
  background-color: var(--button-background-color);
  color: var(--button-color);
  font-size: var(--button-font-size);
  font-style: var(--button-font-style);
  font-weight: var(--button-font-weight);
  line-height: var(--button-line-height);
  text-decoration: var(--button-text-decoration);
  text-transform: var(--button-text-transform);
}
.content-formatted .custom-btn:hover,
.content-formatted .form_submit input:hover {
  opacity: .75;
}
