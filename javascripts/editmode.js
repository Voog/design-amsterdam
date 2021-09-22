;(function($) {
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

    var normalizeValue = function(value) {
      if (value == null || (typeof value == 'string' && value.match(/^[\\'"]+$/))) {
        return '';
      } else {
        return value;
      }
    };

    // Header background image and color save logic function.
    var headerBgCommit = function(data, dataName) {
      var commitData = $.extend(true, {}, data);
      commitData.image = data.image || '';
      commitData.imageSizes = normalizeValue(data.imageSizes);
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

    var bindCustomTexteditorStyles = function(buttonTranslation) {
      window.edy = window.edy || [];
      edy.push(['texteditorStyles', {name: buttonTranslation, tagname:'a', attribute: {'href': '#'}, classname: 'custom-btn', toggle: true}]);
    };

  window.site = $.extend(window.site || {}, {
    toggleFlags: toggleFlags,
    getImageByWidth: getImageByWidth,
    headerBgPreview: headerBgPreview,
    headerBgCommit: headerBgCommit,
    handleHeaderColorScheme: handleHeaderColorScheme,
    bindCustomTexteditorStyles: bindCustomTexteditorStyles
  });

})(jQuery);
