'use strict';

/* Form placeholders */
(function($) {
  var EdicyFormPlaceholders = function(el) {
    this.$el = $(el);
    this.init();
  };

  EdicyFormPlaceholders.prototype = {
    init: function() {
      $('.form_field').each($.proxy(function(idx, field) {
        if ($(field).find('input[type="text"]').length > 0) {
          $(field).find('input[type="text"]').attr('placeholder', $(field).find('label').text());
          $(field).find('label').hide();
          if ($.fn.placeholder) {
            $(field).find('input[type="text"]').placeholder();
          }
        }
        if ($(field).find('textarea').length > 0) {
          $(field).find('textarea').attr('placeholder', $(field).find('label').text());
          $(field).find('label').hide();
          if ($.fn.placeholder) {
            $(field).find('textarea').placeholder();
          }
        }
      }, this));
    }
  };

  $.fn.edicyFormPlaceholders = function () {
    return this.each(function () {
      var data = $(this).data('edicyFormPlaceholders');
      if (!data) {
        $(this).data('edicyFormPlaceholders', new EdicyFormPlaceholders(this));
      }
    });
  };
})(jQuery);

/* General JS */
;(function($) {

  var editmode = $('html').hasClass('editmode');

  // Function to limit the rate at which a function can fire.
  var debounce = function(func, wait, immediate) {
    var timeout;
    return function() {
      var context = this, args = arguments;
      var later = function() {
        timeout = null;
        if (!immediate) func.apply(context, args);
      };
      var callNow = immediate && !timeout;
      clearTimeout(timeout);
      timeout = setTimeout(later, wait);
      if (callNow) func.apply(context, args);
    };
  };

  var bindSideClicks = function() {
    $('.content').on('mousedown', function(event) {
      if (!$(event.target).closest('.js-prevent-sideclick').length) {
        $('.js-image-settings-popover').toggleClass('active');
      };
    });
  };

  // ===========================================================================
  // Load product cover images only when they are close or appearing in the
  // viewport.
  // ===========================================================================
  var callback_loaded = function (element) {
    var $contentItemBox = $(element).closest('.js-content-item-box');
    $contentItemBox.removeClass('not-loaded with-error').addClass('is-loaded');
  };

  var bindContentItemImageLazyload = new LazyLoad({
    threshold: 500,
    elements_selector: ".js-lazyload",
    callback_loaded: callback_loaded
  });

  $('.js-cart-btn').click(function() {
    if ($(this).data('product-id')) {
      Voog.ShoppingCart.addProductById($(this).data('product-id'))
    }
  });

  var handleWindowScroll = function() {
    window.addEventListener('scroll', function(e) {
      var wrapperHeight = $('.header_fixed').height();
      $('.t-sticky').css('top', $('.header_fixed').outerHeight() + 32);

      if (window.scrollY > wrapperHeight) {
        $('.header_fixed:not(.relative)').addClass('scroll');
        $('body').addClass('scroll');
      } else {
        $('.header_fixed').removeClass('scroll');
        $('body').removeClass('scroll');
      }
    });
  };

  var handleProductPageContent = function () {
    $(document).ready(function () {
      changeProductImagePos();
    });

    $(window).resize(debounce(function() {
      changeProductImagePos();
    }, 25));

    var changeProductImagePos = function () {
      var productGallery = $('.js-product-gallery');
      var productImageContentBox = $('.js-content-item-box');
      var productRightContent = $('.js-product-content-right');

      if ($('.js-buy-btn-content .edy-buy-button-container').length >= 1) {
        if ($(window).width() < 640) {
          if ($('.js-product-content-right + .js-product-gallery').length === 0) {
            productRightContent.append(productGallery);
          }
        } else {
          if ($('.js-content-item-box + .js-product-gallery').length === 0) {
            productImageContentBox.append(productGallery);
          }
        }
      }
    }
  };

  var bindFallbackHeaderLeftWidthCalculation = function() {
    var headerWidth = $('.js-header-inner').width(),
        headerRight = $('.js-header-right'),
        headerRightWidth = headerRight.width(),
        headerRightMargin = parseInt(headerRight.css('margin-left')) + 1;


    $('.js-header-left').css('min-width', headerWidth - headerRightWidth - headerRightMargin);
  };

  // TODO: Remove if Edicy is going to wrap table with the container
  var wrapTables = function() {
    if (!editmode) {
      $.each($('.content-formatted table'), function() {
        $(this).wrap('<div class="table-container"></div>');
      });
    }
  };

  var toggleMainMenu = function() {
    $('.js-menu-toggle').click(function() {
      $(this).toggleClass('open');
      $('.mobile-menu').toggleClass('expanded');
      if ($(this).hasClass('open')) {
        $('.js-search').addClass('hidden');
      } else {
        $('.js-search').removeClass('hidden');
      }
    });
  };

  var toggleLangMenu = function() {
    $('#lang-menu-toggle').click(function(event) {
      event.stopPropagation();
      $(this).toggleClass('open');
      $('#toggleable-lang-menu').toggleClass('expanded');
    });
    $('body').on('click', function(event) {
      var $t = $(event.target);
      if ($t.closest('.toggleable-lang-menu').length === 0 && !$t.is('#toggleable-lang-menu')) {
        $('#toggleable-lang-menu').removeClass('expanded');
        $('body').removeClass('voog-search-visible');
      }
      $('#lang-menu-toggle').removeClass('open');
    });
  };

  var handlePopoverMenuHide = function() {
    $('html').click(function(event) {
      var $t = $(event.target);
      if ($t.closest('.mobile-menu').length === 0 && $t.closest('.toggle-btn').length === 0) {
        if ($('.mobile-menu').hasClass('expanded')) {
          $('.mobile-menu').removeClass('expanded');
          $('.js-menu-toggle').removeClass('open');

          if (!$('.js-menu-toggle').hasClass('open')) {
            $('.js-search').removeClass('hidden');
          }
        }
      }
    });
  };

  var handleSearch = function() {
    $('.js-search-reset').click(function(event) {
      event.preventDefault();
      $('body').removeClass('voog-search-visible');
    });

    $('.js-search-open').click(function(event) {
      event.stopPropagation();
      $('body').addClass('voog-search-visible');
      $('.js-search-input').val('').focus();
    });

    $('.js-search-close').click(function(event) {
      $('body').removeClass('voog-search-visible');
    });

    $('.js-search-input').click(function(event) {
      event.stopPropagation();
    });

    $('.js-voog-search-modal-inner').click(function(event) {
      event.stopPropagation();
    });
  };

  // ===========================================================================
  // Binds site search functionality.
  // ===========================================================================
  var bindSiteSearch = function(searchForm, languageCode, noResultsString) {
    if (searchForm) {
      var search = new VoogSearch(searchForm, {
        // This defines the number of results per query.
        per_page: 10,
        // Language code for restricting the search to page language.
        lang: languageCode,
        // If given, an DOM element results are rendered inside that element
        resultsContainer: $('.js-voog-search-modal-inner').get(0),
        // Defines if modal should close on sideclick.
        sideclick: true,
        // Mobile checkpoint.
        mobileModeWidth: 640,
        // Updates results on every keypress.
        updateOnKeypress: true,
        // String for feedback if no results are found.
        noResults: noResultsString
      });
    }
  };

  var handleWindowResize = function() {
    // Add functions that should be trgiggered while resizing the window here.
    // Example:
    // $(window).resize(debounce(yourFunctionName, 3000));
  };

  var handlePostMinHeight = function() {
    $(window).ready(function(){
      $('.post').each(function(n, el) {
        var $post = $(el);
        var height = $post.find('.post-header').height();
        $post.find('.post-content').css('min-height', height);
      });
    });
  };

  var focusCommentsWithErrors = function() {
    $(document).ready(function() {
      if ($('.comment-form').hasClass('form_with_errors')) {
        $('html, body').scrollTop($('.comment-form').offset().top);
      } else if ($('form').find('.form_error, .form_notice').length > 0) {
        $('html, body').scrollTop($('.form_error, .form_notice').closest('form').offset().top);
      }
    });
  };

  // Initiations
  var initFrontPage = function(animation) {
    animation = typeof animation == 'undefined' ? false : animation;
    if (animation) {
      initStickyElements({
        stickyHeader: true,
        stickyMobileMenu: true,
        stickyFooter: false,
        stickyPostHeaders: false
      });
    }
  };
  var initCommonPage = function(animation) {
    animation = typeof animation == 'undefined' ? false : animation;
    if (animation) {
      initStickyElements({
        stickyHeader: true,
        stickyMobileMenu: true,
        stickyFooter: false,
        stickyPostHeaders: false
      });
    }
    if ($.fn.autogrow) {
      $('.form_field_textarea').autogrow();
    }
    $(window).ready(function() {
      if (!($.trim($('.content-header').get(0).innerHTML))) {
        $('.content-header').hide();
      }
    });
  };
  var initArticlePage = function(animation) {
    animation = typeof animation == 'undefined' ? false : animation;
    if (animation) {
      initStickyElements({
        stickyHeader: true,
        stickyMobileMenu: true,
        stickyFooter: false,
        stickyPostHeaders: false
      });
    }
    if ($.fn.autogrow) {
      $('.form_field_textarea').autogrow();
    }
  };
  var initBlogPage = function(animation) {
    animation = typeof animation == 'undefined' ? false : animation;
    if (animation) {
      initStickyElements({
        stickyHeader: true,
        stickyMobileMenu: true,
        stickyFooter: true,
        stickyPostHeaders: true
      });
    }
    handlePostMinHeight();
  };

  var initStickyElements = function(opts) {
    var stickyHeader = opts.stickyHeader || false,
    stickyMobileMenu = opts.stickyMobileMenu || false,
    stickyFooter = opts.stickyFooter || false,
    stickyPostHeaders = opts.stickyPostHeaders || false,
    startScroll,
    endScroll,
    scrolled,
    container = $('.container'),
    header = $('.header'),
    footer = $('.footer'),
    headerStaticArea = $(header).height() + 90,
    footerStaticArea = $(footer).height() + 90,
    footerExpandTimeout,
    latestKnownScrollY = 0,
    ticking = false;

    var getPostHeights = function () {
      var posts = $('.post'),
      heights = [];
      posts.each(function(n, el) {
        heights.push(el.getBoundingClientRect().top);
      });
      return heights;
    };

    var handler = function (postHeights) {
      if (!startScroll) {
        startScroll = $(window).scrollTop();
      } else {
        endScroll = $(window).scrollTop();
        scrolled = endScroll - startScroll;
        if (window.innerWidth < 640 && stickyMobileMenu) {
          if (scrolled > 5 && startScroll > headerStaticArea) {
            $('.topbar').addClass('fixed').css({'top' : -headerStaticArea});
          } else if (scrolled < -5 && startScroll > headerStaticArea) {
            $('.topbar').addClass('fixed').css({'top' : 0});
          } else if (scrolled < 0 && startScroll <= 100 && $('.topbar').hasClass('fixed') === true) {
            $(container).css({'margin-top' : 0});
            $('.topbar').removeClass('fixed');
          }
        }
        if (window.innerWidth > 640 && stickyFooter) {
          if ($('.post').eq(0).offset().top - $(window).innerHeight() + 90 < $(document).scrollTop()) {
            if (startScroll + window.innerHeight <= $(document).height() - footerStaticArea - 40) {
              // above footer
              if (scrolled < -5) {
                fixFooter(false);
              // down and above footer
            } else if (scrolled > 5) {
              hideFooter();
            }
          } else {
              // down and below footer + 90px
              resetFooter();
            }
          } else {
            resetFooter();
          }
        }
        if (stickyHeader && $(header).find('.header-inner').height() < 60) {
          // Scrolling down and offset is larger than
          if (scrolled > 5 && startScroll > headerStaticArea) {
            hideHeader();

          // Up and fixed area
        } else if (scrolled < -5 && startScroll > headerStaticArea) {
          fixHeader();
          setTimeout(function() {
            if ($(window).scrollTop() <= headerStaticArea) {
              resetHeader();
            }
          }, 20);

          // Up, static area and header is fixed
        } else if (scrolled < -5 && startScroll <= headerStaticArea) {
          resetHeader();
        }
      }
      startScroll = 0;
    }
    if (window.innerWidth > 640 && stickyPostHeaders) {
      $('.post').each(function(n, el) {
        var offset = 30,
        $header = $(el).find('.post-header'),
        topBoundary = 0 + offset,
        bottomBoundary = -($(el).height() - offset - $header.height());

          // scroll is between top and bottom of the .post
          if (postHeights[n] < topBoundary) {
            // scroll is inside .post
            if (postHeights[n] > bottomBoundary) {
              $header.removeClass('top bottom');
              $(el).addClass('fixed-header');
            // scroll is below .post
          } else {
            $header.addClass('bottom').removeClass('top');
            $(el).removeClass('fixed-header');
          }
          // scroll is above .post
        } else {
          $header.addClass('top').removeClass('bottom');
          $(el).removeClass('fixed-header');
        }
      });
    }
  };

  var hideHeader = function() {
    $(header).addClass('header-fixed').css({'top' : -headerStaticArea});
    $(container).css({'padding-top' : headerStaticArea});
  };

  var fixHeader = function() {
    var headerOffset;

    if ($('body').hasClass('edy-checkout-button-visible')) {
      headerOffset = $('.edy-ecommerce-shopping-cart-button').outerHeight();
    } else {
      headerOffset = 0;
    }

    $(header).addClass('header-fixed header-animated').css({'top' : headerOffset});

    $(container).css({'padding-top' : headerStaticArea});
  };

  var resetHeader = function() {
    $(header).removeClass('header-fixed header-animated');
    $(container).css({'padding-top' : 0});
    $('.post.fixed-header').removeClass('fixed-header');
  };

  var hideFooter = function() {
    $(footer).addClass('footer-fixed footer-animated footer-hidden');
    $(footer).css('bottom', -$(footer).outerHeight());
  };

  var resetFooter = function() {
    $(footer).removeClass('footer-fixed footer-animated footer-hidden');
    $('body').removeClass('voog-search-visible');
    $(footer).css({'bottom': '', 'left': '' });
    $(container).css({'margin-bottom' : ''});
  };

  var fixFooter = function(expanded) {
    expanded = expanded || false;
    $(footer).addClass('footer-fixed footer-animated');
    $(footer).css({
      'left' : $('.container').offset().left,
      'bottom': (expanded ? 0 : (-$(footer).height() + 60))
    });
    $(container).css({'margin-bottom' : footerStaticArea});
  };

  var expandFooter = function(expand) {
    if (expand) {
      if ($(footer).hasClass('footer-fixed')) {
        clearTimeout(footerExpandTimeout);
        fixFooter(true);
        $('footer .gradient-overlay').hide();
      }
    } else {
      if ($('footer').hasClass('footer-fixed')) {
        footerExpandTimeout = setTimeout(function() {
          fixFooter(false);
          $('footer .gradient-overlay').show();
        }, 1500);
      }
    }
  };

  var onScroll = function() {
    latestKnownScrollY = window.scrollY;
    requestTick();
  };

  var requestTick = function() {
    if (!ticking) { requestAnimationFrame(update); }
    ticking = true;
  };

  var update = function() {
    ticking = false;
    // NOTE: Animated header on mobile screen is too buggy. To fix it a huge
    // refactor is needed. Disableing it is a quicker and less painful method.
    if ($(window).width() > 640) {
      handler(getPostHeights());
    }
  };

  $(window).on('load resize', function() {
    // NOTE: Animated header on mobile screen is too buggy. To fix it a huge
    // refactor is needed. Disableing it is a quicker and less painful method.
    if ($(window).width() > 640) {
      handler(getPostHeights());
    } else {
      $('.container').css({
        'padding-top': '',
        'margin-bottom': ''
      });

      $('.header-fixed').removeClass('header-fixed header-animated').css('top', '');
    }
  }).on('scroll', onScroll);

  $('footer').bind('mouseenter', function() {
    expandFooter(true);
  }).bind('mouseleave', function() {
    expandFooter(false);
  });
};

  var init = function() {
    bindSideClicks();
    toggleMainMenu();
    toggleLangMenu();
    handlePopoverMenuHide();
    handleWindowResize();
    handleSearch();
    wrapTables();
    focusCommentsWithErrors();
    handleWindowScroll();

    $('.content form').edicyFormPlaceholders();

    if (!Modernizr.flexbox && editmode) {
      bindFallbackHeaderLeftWidthCalculation();
    };
  };

  window.site = $.extend(window.site || {}, {
    initFrontPage: initFrontPage,
    initCommonPage: initCommonPage,
    initBlogPage: initBlogPage,
    initArticlePage: initArticlePage,
    bindSiteSearch: bindSiteSearch,
    handleProductPageContent:handleProductPageContent
  });

init();
})(jQuery);
