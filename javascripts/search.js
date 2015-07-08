/* search */
;(function($) {
    var searcherUIdefaults = {
        lang: 'en',
        resultTpl: '<div class="voog-search-result"><h3 class="voog-search-result-title"><a class="voog-search-result-link" href="[[url]]">[[title]]</a></h3><p class="voog-search-result-content">[[content]]</p></div>',
        modalTpl: '<div class="voog-search-container"><div class="voog-search-inner"><div class="voog-search-results"></div><div class="voog-search-noresults"></div><div class="voog-search-loader"></div></div></div>',
        noResults: 'No results found!',
        minChars : 3,
        $parent: $('body'),
        closeOnSideClick: true
    };

    var SearcherUI = function ($el, options) {
        this.$el = $el;
        this.options = $.extend({}, searcherUIdefaults, options);
        this.init();
    };

    SearcherUI.prototype = {

        init: function() {

            this.$input = this.$el.find('input[type="search"], input[type="text"]');
            this.$modal = this.createModal();
            this.$content = this.$modal.find('.voog-search-inner');
            this.$loader = this.$modal.find('.voog-search-loader');
            this.$results = this.$modal.find('.voog-search-results');
            this.$noresults = this.$modal.find('.voog-search-noresults');
            this.$clearbtn = this.$el.find('.js-search-close');
            this.$submitbtn = this.$el.find('.js-search-submit');
            this.searcher = new VoogSearchSDK(this.filterParams(this.options), $.proxy(this.handleSearchResult, this));

            this.$el.on('submit', $.proxy(this.handleSubmit, this));
            this.$input.on('keyup', $.proxy(this.handleInputKeyup, this));
            this.$input.on('focus', $.proxy(this.handleInputFocus, this));
            this.$input.on('blur', $.proxy(this.handleInputBlur, this));
            this.$clearbtn.on('click', $.proxy(this.handleClearButtonClick, this));
            this.$submitbtn.on('click', $.proxy(this.handleSubmitButtonClick, this));
            this.$content.on('scroll', $.proxy(this.handleModalScroll, this));
        },
        createModal: function() {
            var $modal = $(this.options.modalTpl);
            $modal.appendTo(this.options.$parent);
            this.$modal = $modal;
            this.adjustModalMargin();
            this.$modal.hide();
            $('body').removeClass('voog-search-visible');

            return $modal;
        },

        adjustModalMargin: function() {
            var footerOffset = $('.footer').offset().left,
                searchFormWidth = $('.footer .search-form').width(),
                footerLeftPadding = parseInt($('.footer').css('padding-left')),
                footerRightPadding = parseInt($('.footer').css('padding-right')),
                extraPadding = footerOffset > 0 ? 10 : 0,
                extraPadding = (footerLeftPadding > 0 ? extraPadding : 30),
                marginLeft = footerOffset + searchFormWidth + footerLeftPadding + footerRightPadding + extraPadding;
            this.$modal.css('margin-left', marginLeft);
        },

        filterParams: function(p) {
            var allowed = ['per_page', 'page', 'lang', 'q', 'types', 'tags', 'path', 'tag_facets'],
                o = {};
            for (var i = allowed.length; i--;) {
                if (typeof p[allowed[i]] !== "undefined") {
                    o[allowed[i]] = p[allowed[i]];
                }
            }
            return o;
        },

        handleSubmit: function(event) {
            event.preventDefault();

            var oldVal = this.$input.data('oldValue') || '',
                newVal = this.$input.val();

            if (newVal != oldVal && newVal.length >= this.options.minChars) {
                this.$input.data('oldValue', newVal);
                this.doSearch();
            }

            return false;
        },

        handleInputKeyup: function(event) {
            if (this.options.searchOnType) {

                var oldVal = this.$input.data('oldValue') || '',
                    newVal = this.$input.val();

                if (newVal.length > 0) {
                    this.$submitbtn.hide();
                    this.$clearbtn.show();
                } else {
                    this.$submitbtn.show();
                    this.$clearbtn.hide();
                }

                if (newVal != oldVal && newVal.length >= this.options.minChars) {
                    this.$input.data('oldValue', newVal);
                    this.doSearch();
                }
            }
        },

        handleInputFocus: function() {
            this.$el.find('.search-box').addClass('search-box-focus');
        },

        handleInputBlur: function() {
            var visibleClass = this.options.visibleClass ? this.options.visibleClass : 'voog-search-visible';
            if (!$('body').hasClass(visibleClass)) {
                this.$el.find('.search-box').removeClass('search-box-focus');
                this.reset();
            }
        },

        handleSideClick: function(event) {
            if (!$.contains(this.$modal.find('.voog-search-inner'), event.target) && event.target !== this.$modal.find('.voog-search-inner') && event.target !== this.$input.get(0)) {
                this.reset();
            }
        },

        handleClearButtonClick: function(event) {
            event.preventDefault();
            this.reset();
        },

        handleSubmitButtonClick: function(event) {
            this.handleSubmit(event);
        },

        handleModalScroll: function(event) {
            var y = this.$content.scrollTop();
                maxy = this.$content.get(0).scrollHeight - this.$content.get(0).offsetHeight,
                treshold = 10;

            if (y >= maxy - 10 && !this.loading_active && this.pageLinks && this.pageLinks.page < this.pageLinks.total) {
                this.fetchNextPage();
            }
        },

        doSearch: function() {
            this.adjustModalMargin();
            this.$modal.show();
            $('body').removeClass('voog-search-visible');

            clearTimeout(this.timeout);
            this.timeout = setTimeout($.proxy(function() {

            var val = this.$input.val();

            if (val.length >= this.options.minChars) {
                var showLoader = true,
                    visibleClass = this.options.visibleClass ? this.options.visibleClass : 'voog-search-visible';
                if (!$('body').hasClass(visibleClass)) {
                    $('body').addClass(visibleClass);
                    if (this.options.closeOnSideClick) {
                        $(document).on('click.voog-search-sideclick', $.proxy(this.handleSideClick, this));
                    }

                    showLoader = true;
                }

                this.setLoader(showLoader);

                //this.searcher.abort();
                this.loading_active = true;
                this.searcher.query({
                    q: val
                });
            };
            }, this), 400);
        },

        setLoader: function(showLoader) {
            this.$results.empty().hide();
            this.$noresults.removeClass('voog-search-noresults-visible');
            if (showLoader) { this.$loader.show(); }
        },

        unsetLoader: function() {
            this.$loader.hide();
        },

        hideSearch: function() {
            var visibleClass = this.options.visibleClass ? this.options.visibleClass : 'voog-search-visible';
            $('body').removeClass(visibleClass);
            this.$el.find('.search-box').removeClass('search-box-focus');
            $(document).off('click.voog-search-sideclick');
            this.$submitbtn.show();
            this.$clearbtn.hide();
        },

        reset: function() {
            this.$input.data('oldValue', '').val('');
            this.hideSearch();
        },

        handleSearchResult: function(data) {
            this.loading_active = false;
            this.pageLinks = data.pages;
            this.renderContent(data.result);
            this.unsetLoader();
            this.testScroll();
        },

        renderContent: function(results) {
            if(results.length) {
                this.$results.show();
                for (var i = 0, max = results.length; i< max; i++) {

                    var resultHtml = this.options.resultTpl.replace(/\[\[url\]\]/g, results[i].path).replace(/\[\[title\]\]/g, results[i].title).replace(/\[\[content\]\]/g, results[i].description);
                    this.$results.append($(resultHtml));
                }
            } else {
                this.$noresults.addClass('voog-search-noresults-visible').empty().append('<div>' + this.options.noResults + '</div>').show();
            }
        },

        fetchNextPage: function() {
            this.loading_active = true;
            this.pageLinks.next();
        },

        testScroll: function() {
            if (this.$content.get(0).offsetHeight === this.$content.get(0).scrollHeight) {
                if (!this.loading_active && this.pageLinks && this.pageLinks.page < this.pageLinks.total) {
                    this.fetchNextPage();
                }
            }
        }
    };
    window.VoogSearch = SearcherUI;
})(jQuery);
