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

  // Remove comments if debouncing is used.
  // Function to limit the rate at which a function can fire.
  // var debounce = function(func, wait, immediate) {
  //   var timeout;
  //   return function() {
  //     var context = this, args = arguments;
  //     var later = function() {
  //       timeout = null;
  //       if (!immediate) func.apply(context, args);
  //     };
  //     var callNow = immediate && !timeout;
  //     clearTimeout(timeout);
  //     timeout = setTimeout(later, wait);
  //     if (callNow) func.apply(context, args);
  //   };
  // };

  var toggleFlags = function() {
    $('.js-option-toggle-flags').on('click', function(event) {
      event.stopPropagation();

      if ($(this).hasClass('js-flag-disable-btn')) {
        var flagsState = false;
      } else {
        var flagsState = true;
      }

      $(this).toggleClass('js-flag-disable-btn');
      $('body').toggleClass('flags-enabled flags-disabled');

      siteData.set("flags_state", flagsState);
    });
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

  var handleWindowResize = function() {
    // Add functions that should be trgiggered while resizing the window here.
    // Example:
    // $(window).resize(debounce(yourFunctionName, 3000));
  };

  // Returns the suitable version of the image depending on the viewport width.
  var getImageByWidth = function(sizes, targetWidth) {
    var prevImage;

    for (var i = 0, max = sizes.length; i < max; i++) {
      if (sizes[i].width < targetWidth) {
        return prevImage || sizes[i];
      }
      prevImage = sizes[i];
    }
    // Makes sure that smallest is returned if all images bigger than targetWidth.
    return sizes[sizes.length - 1];
  };

  var headerBgImageSizesContains = function(sizes, url) {
    for (var i = sizes.length; i--;) {
      if (url.indexOf(sizes[i].url.trim()) > -1) {
        return true;
      }
    }
    return false;
  };

  // Checks the lightness sum of header background image and color and sets the lightness class depending on it's value.
  var handleHeaderImageLightnessClass = function() {
    if (headerBgCombinedLightness >= 0.5) {
      $('.js-background-type').addClass('light-background').removeClass('dark-background');
    } else {
      $('.js-background-type').addClass('dark-background').removeClass('light-background');
    }
  };

  // Header background image and color preview logic function.
  var headerBgPreview = function(data, header) {
    // Defines the variables used in preview logic.

    var headerBgImagePrevious = $('.js-header-banner').css('background-image'),
        headerBgImageSuitable = data.imageSizes ? getImageByWidth(data.imageSizes, $(window).width()) : null,
        headerBgImage = (data.image && data.image !== '') ? 'url(' + headerBgImageSuitable.url + ')' : 'none',
        headerBgImageSizes = (data.imageSizes && data.imageSizes !== '') ? data.imageSizes : null,
        headerBgColor = (data.color && data.color !== '') ? data.color : 'rgba(0,0,0,0)',
        headerBgColorDataLightness = (data.colorData && data.colorData !== '') ? data.colorData.lightness : 1,
        colorExtractImage = $('<img>'),
        colorExtractCanvas = $('<canvas>'),
        colorExtractImageUrl = (data.image && data.image !== '') ? data.image : null;

    if (colorExtractImageUrl) {
      if (headerBgImageSizesContains(headerBgImageSizes, headerBgImagePrevious)) {
        headerBg.headerBgImageColor = headerBg.headerBgImageColor ? headerBg.headerBgImageColor : 'rgba(178,198,207,1)';
        headerBgCombinedLightness = getCombinedLightness(headerBg.headerBgImageColor, headerBgColor);
        handleHeaderImageLightnessClass();
      } else {
        colorExtractImage.attr('src', colorExtractImageUrl.replace(/.*\/(photos|voogstock)/g,'/photos'));
        colorExtractImage.on('load', function() {
          ColorExtract.extract(colorExtractImage[0], colorExtractCanvas[0], function(data) {
            headerBg.headerBgImageColor = data.bgColor ? data.bgColor : 'rgba(255,255,255,1)';
            headerBgCombinedLightness = getCombinedLightness(headerBg.headerBgImageColor, headerBgColor);
            handleHeaderImageLightnessClass();
          });
        });
      };
    } else {
      headerBg.headerBgImageColor = 'rgba(255,255,255,1)';
      headerBgCombinedLightness = getCombinedLightness(headerBg.headerBgImageColor, headerBgColor);
      handleHeaderImageLightnessClass();
    };

    // Updates the header background image and background color.
    $(header).css({'background-image' : headerBgImage});
    $(header).find('.background-color').css({'background-color' : headerBgColor});
  };

  // Header background image and color save logic function.
  var headerBgCommit = function(data, dataName) {
    var commitData = $.extend(true, {}, data);
    commitData.image = data.image || '';
    commitData.imageSizes = data.imageSizes || '';
    commitData.color = data.color || 'rgba(255,255,255,0)';
    commitData.combinedLightness = headerBgCombinedLightness;
    pageData.set(dataName, commitData);
  }

  var colorSum = function(bgColor, fgColor) {
    if (bgColor && fgColor) {
      if (typeof bgColor == 'string') {
        bgColor = bgColor.replace(/rgba?\(/,'').replace(/\)/,'').split(',');
        $.each(bgColor, function(n, x) {bgColor[n] = +x;});
      }
      if (typeof fgColor == 'string') {
        fgColor = fgColor.replace(/rgba?\(/,'').replace(/\)/,'').split(',');
        $.each(fgColor, function(n, x) {fgColor[n] = +x;});
      }
      if (typeof bgColor == 'object' && bgColor.hasOwnProperty('length')) {
        if (bgColor.length == 3) { bgColor.push(1.0); }
      }
      if (typeof fgColor == 'object' && fgColor.hasOwnProperty('length')) {
        if (fgColor.length == 3) { fgColor.push(1.0); }
      }
      var result = [0, 0, 0, 0];
      result[3] = 1 - (1 - fgColor[3]) * (1 - bgColor[3]);
      if (result[3] === 0) { result[3] = 1e-6; }
      result[0] = Math.min(fgColor[0] * fgColor[3] / result[3] + bgColor[0] * bgColor[3] * (1 - fgColor[3]) / result[3], 255);
      result[1] = Math.min(fgColor[1] * fgColor[3] / result[3] + bgColor[1] * bgColor[3] * (1 - fgColor[3]) / result[3], 255);
      result[2] = Math.min(fgColor[2] * fgColor[3] / result[3] + bgColor[2] * bgColor[3] * (1 - fgColor[3]) / result[3], 255);
      return $.map(result, function(e) { return Math.floor(e); });
    }
  };

  var getCombinedColor = function(bgColor, fgColor) {
    var sum = colorSum(bgColor || [255,255,255,1], fgColor || [255,255,255,1]);
    return sum;
  };

  var getCombinedLightness = function(bgColor, fgColor) {
    var combinedColor = getCombinedColor(bgColor, fgColor);
    var color = Math.round(((+combinedColor[0]) * 0.2126 + (+combinedColor[1]) * 0.7152 + (+combinedColor[2]) * 0.0722) / 2.55) / 100;
    return color;
  };

  var handleHeaderColorScheme = function(lightness) {
    if (typeof lightness != 'undefined') {
      if (lightness > 0.6) {
        $('.header-wrapper').addClass('light').removeClass('dark');
      } else {
        $('.header-wrapper').addClass('dark').removeClass('light');
      }
    }
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

var bindCustomTexteditorStyles = function(buttonTranslation) {
  window.edy = window.edy || [];
  edy.push(['texteditorStyles', {name: buttonTranslation, tagname:'a', attribute: {'href': '#'}, classname: 'custom-btn', toggle: true}]);
};

var init = function() {
  toggleMainMenu();
  toggleLangMenu();
  handlePopoverMenuHide();
  handleWindowResize();
  handleSearch();
  wrapTables();
  focusCommentsWithErrors();

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
  toggleFlags: toggleFlags,
  getImageByWidth: getImageByWidth,
  headerBgPreview: headerBgPreview,
  headerBgCommit: headerBgCommit,
  handleHeaderColorScheme: handleHeaderColorScheme,
  bindCustomTexteditorStyles: bindCustomTexteditorStyles
});

init();
})(jQuery);
