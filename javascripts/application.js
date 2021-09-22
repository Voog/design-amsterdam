/**
 * Auto-growing textareas; technique ripped from Facebook
 *
 * http://github.com/jaz303/jquery-grab-bag/tree/master/javascripts/jquery.autogrow-textarea.js
 */
(function($)
{
  $.fn.autogrow = function(options)
  {
    return this.filter('textarea').each(function()
    {
      var self         = this;
      var $self        = $(self);
      var minHeight    = $self.height();
      var noFlickerPad = $self.hasClass('autogrow-short') ? 0 : parseInt($self.css('lineHeight')) || 0;

      var shadow = $('<div></div>').css({
        position:    'absolute',
        top:         -10000,
        left:        -10000,
        width:       $self.width(),
        fontSize:    $self.css('fontSize'),
        fontFamily:  $self.css('fontFamily'),
        fontWeight:  $self.css('fontWeight'),
        lineHeight:  $self.css('lineHeight'),
        resize:      'none',
      'word-wrap': 'break-word'
      }).appendTo(document.body);

      var update = function(event)
      {
        var times = function(string, number)
        {
          for (var i=0, r=''; i<number; i++) r += string;
          return r;
        };

        var val = self.value.replace(/</g, '&lt;')
                  .replace(/>/g, '&gt;')
                  .replace(/&/g, '&amp;')
                  .replace(/\n$/, '<br/>&nbsp;')
                  .replace(/\n/g, '<br/>')
                  .replace(/ {2,}/g, function(space){ return times('&nbsp;', space.length - 1) + ' '; });

        // Did enter get pressed?  Resize in this keydown event so that the flicker doesn't occur.
        if (event && event.data && event.data.event === 'keydown' && event.keyCode === 13) {
          val += '<br />';
        }

        shadow.css('width', $self.width());
        shadow.html(val + (noFlickerPad === 0 ? '...' : '')); // Append '...' to resize pre-emptively.
        $self.height(Math.max(shadow.height() + noFlickerPad, minHeight));
      };

      $self.change(update).keyup(update).keydown({event:'keydown'},update);
      $(window).resize(update);

      update();
    });
  };
})(jQuery);

// quantize.js, Copyright 2012 Shao-Chung Chen.
// Licensed under the MIT license (http://www.opensource.org/licenses/mit-license.php)

// Basic CoffeeScript port of the (MMCQ) Modified Media Cut Quantization
// algorithm from the Leptonica library (http://www.leptonica.com/).
// Return a color map you can use to map original pixels to the reduced palette.
// 
// Rewritten from the JavaScript port (http://gist.github.com/1104622)
// developed by Nick Rabinowitz under the MIT license.

// Generated by CoffeeScript 1.3.3
var MMCQ, PriorityQueue;

PriorityQueue = (function() {

  function PriorityQueue(comparator) {
    this.comparator = comparator;
    this.contents = [];
    this.sorted = false;
  }

  PriorityQueue.prototype.sort = function() {
    this.contents.sort(this.comparator);
    return this.sotred = true;
  };

  PriorityQueue.prototype.push = function(obj) {
    this.contents.push(obj);
    return this.sorted = false;
  };

  PriorityQueue.prototype.peek = function(index) {
    if (index == null) {
      index = this.contents.length - 1;
    }
    if (!this.sorted) {
      this.sort();
    }
    return this.contents[index];
  };

  PriorityQueue.prototype.pop = function() {
    if (!this.sorted) {
      this.sort();
    }
    return this.contents.pop();
  };

  PriorityQueue.prototype.size = function() {
    return this.contents.length;
  };

  PriorityQueue.prototype.map = function(func) {
    return this.contents.map(func);
  };

  return PriorityQueue;

})();

MMCQ = (function() {
  var ColorBox, ColorMap, cboxFromPixels, getColorIndex, getHisto, medianCutApply,
    _this = this;

  MMCQ.sigbits = 5;

  MMCQ.rshift = 8 - MMCQ.sigbits;

  function MMCQ() {
    this.maxIterations = 1000;
    this.fractByPopulations = 0.75;
  }

  getColorIndex = function(r, g, b) {
    return (r << (2 * MMCQ.sigbits)) + (g << MMCQ.sigbits) + b;
  };

  ColorBox = (function() {

    function ColorBox(r1, r2, g1, g2, b1, b2, histo) {
      this.r1 = r1;
      this.r2 = r2;
      this.g1 = g1;
      this.g2 = g2;
      this.b1 = b1;
      this.b2 = b2;
      this.histo = histo;
    }

    ColorBox.prototype.volume = function(forced) {
      if (!this._volume || forced) {
        this._volume = (this.r2 - this.r1 + 1) * (this.g2 - this.g1 + 1) * (this.b2 - this.b1 + 1);
      }
      return this._volume;
    };

    ColorBox.prototype.count = function(forced) {
      var b, g, index, numpix, r, _i, _j, _k, _ref, _ref1, _ref2, _ref3, _ref4, _ref5;
      if (!this._count_set || forced) {
        numpix = 0;
        for (r = _i = _ref = this.r1, _ref1 = this.r2; _i <= _ref1; r = _i += 1) {
          for (g = _j = _ref2 = this.g1, _ref3 = this.g2; _j <= _ref3; g = _j += 1) {
            for (b = _k = _ref4 = this.b1, _ref5 = this.b2; _k <= _ref5; b = _k += 1) {
              index = getColorIndex(r, g, b);
              numpix += this.histo[index] || 0;
            }
          }
        }
        this._count_set = true;
        this._count = numpix;
      }
      return this._count;
    };

    ColorBox.prototype.copy = function() {
      return new ColorBox(this.r1, this.r2, this.g1, this.g2, this.b1, this.b2, this.histo);
    };

    ColorBox.prototype.average = function(forced) {
      var b, bsum, g, gsum, hval, index, mult, r, rsum, total, _i, _j, _k, _ref, _ref1, _ref2, _ref3, _ref4, _ref5;
      if (!this._average || forced) {
        mult = 1 << (8 - MMCQ.sigbits);
        total = 0;
        rsum = 0;
        gsum = 0;
        bsum = 0;
        for (r = _i = _ref = this.r1, _ref1 = this.r2; _i <= _ref1; r = _i += 1) {
          for (g = _j = _ref2 = this.g1, _ref3 = this.g2; _j <= _ref3; g = _j += 1) {
            for (b = _k = _ref4 = this.b1, _ref5 = this.b2; _k <= _ref5; b = _k += 1) {
              index = getColorIndex(r, g, b);
              hval = this.histo[index] || 0;
              total += hval;
              rsum += hval * (r + 0.5) * mult;
              gsum += hval * (g + 0.5) * mult;
              bsum += hval * (b + 0.5) * mult;
            }
          }
        }
        if (total) {
          this._average = [~~(rsum / total), ~~(gsum / total), ~~(bsum / total)];
        } else {
          this._average = [~~(mult * (this.r1 + this.r2 + 1) / 2), ~~(mult * (this.g1 + this.g2 + 1) / 2), ~~(mult * (this.b1 + this.b2 + 1) / 2)];
        }
      }
      return this._average;
    };

    ColorBox.prototype.contains = function(pixel) {
      var b, g, r;
      r = pixel[0] >> MMCQ.rshift;
      g = pixel[1] >> MMCQ.rshift;
      b = pixel[2] >> MMCQ.rshift;
      return ((this.r1 <= r && r <= this.r2)) && ((this.g1 <= g && g <= this.g2)) && ((this.b1 <= b && b <= this.b2));
    };

    return ColorBox;

  })();

  ColorMap = (function() {

    function ColorMap() {
      this.cboxes = new PriorityQueue(function(a, b) {
        var va, vb;
        va = a.count() * a.volume();
        vb = b.count() * b.volume();
        if (va > vb) {
          return 1;
        } else if (va < vb) {
          return -1;
        } else {
          return 0;
        }
      });
    }

    ColorMap.prototype.push = function(cbox) {
      return this.cboxes.push({
        cbox: cbox,
        color: cbox.average()
      });
    };

    ColorMap.prototype.palette = function() {
      return this.cboxes.map(function(cbox) {
        return cbox.color;
      });
    };

    ColorMap.prototype.size = function() {
      return this.cboxes.size();
    };

    ColorMap.prototype.map = function(color) {
      var i, _i, _ref;
      for (i = _i = 0, _ref = this.cboxes.size(); _i < _ref; i = _i += 1) {
        if (this.cboxes.peek(i).cbox.contains(color)) {
          return this.cboxes.peek(i).color;
        }
        return this.nearest(color);
      }
    };

    ColorMap.prototype.cboxes = function() {
      return this.cboxes;
    };

    ColorMap.prototype.nearest = function(color) {
      var dist, i, minDist, retColor, square, _i, _ref;
      square = function(n) {
        return n * n;
      };
      minDist = 1e9;
      for (i = _i = 0, _ref = this.cboxes.size(); _i < _ref; i = _i += 1) {
        dist = Math.sqrt(square(color[0] - this.cboxes.peek(i).color[0]) + square(color[1] - this.cboxes.peek(i).color[1]) + square(color[2] - this.cboxes.peek(i).color[2]));
        if (dist < minDist) {
          minDist = dist;
          retColor = this.cboxes.peek(i).color;
        }
      }
      return retColor;
    };

    return ColorMap;

  })();

  getHisto = function(pixels) {
    var b, g, histo, histosize, index, pixel, r, _i, _len;
    histosize = 1 << (3 * MMCQ.sigbits);
    histo = new Array(histosize);
    for (_i = 0, _len = pixels.length; _i < _len; _i++) {
      pixel = pixels[_i];
      r = pixel[0] >> MMCQ.rshift;
      g = pixel[1] >> MMCQ.rshift;
      b = pixel[2] >> MMCQ.rshift;
      index = getColorIndex(r, g, b);
      histo[index] = (histo[index] || 0) + 1;
    }
    return histo;
  };

  cboxFromPixels = function(pixels, histo) {
    var b, bmax, bmin, g, gmax, gmin, pixel, r, rmax, rmin, _i, _len;
    rmin = 1e6;
    rmax = 0;
    gmin = 1e6;
    gmax = 0;
    bmin = 1e6;
    bmax = 0;
    for (_i = 0, _len = pixels.length; _i < _len; _i++) {
      pixel = pixels[_i];
      r = pixel[0] >> MMCQ.rshift;
      g = pixel[1] >> MMCQ.rshift;
      b = pixel[2] >> MMCQ.rshift;
      if (r < rmin) {
        rmin = r;
      } else if (r > rmax) {
        rmax = r;
      }
      if (g < gmin) {
        gmin = g;
      } else if (g > gmax) {
        gmax = g;
      }
      if (b < bmin) {
        bmin = b;
      } else if (b > bmax) {
        bmax = b;
      }
    }
    return new ColorBox(rmin, rmax, gmin, gmax, bmin, bmax, histo);
  };

  medianCutApply = function(histo, cbox) {
    var b, bw, doCut, g, gw, index, lookaheadsum, maxw, partialsum, r, rw, sum, total, _i, _j, _k, _l, _m, _n, _o, _p, _q, _ref, _ref1, _ref10, _ref11, _ref12, _ref13, _ref14, _ref15, _ref16, _ref17, _ref2, _ref3, _ref4, _ref5, _ref6, _ref7, _ref8, _ref9;
    if (!cbox.count()) {
      return;
    }
    if (cbox.count() === 1) {
      return [cbox.copy()];
    }
    rw = cbox.r2 - cbox.r1 + 1;
    gw = cbox.g2 - cbox.g1 + 1;
    bw = cbox.b2 - cbox.b1 + 1;
    maxw = Math.max(rw, gw, bw);
    total = 0;
    partialsum = [];
    lookaheadsum = [];
    if (maxw === rw) {
      for (r = _i = _ref = cbox.r1, _ref1 = cbox.r2; _i <= _ref1; r = _i += 1) {
        sum = 0;
        for (g = _j = _ref2 = cbox.g1, _ref3 = cbox.g2; _j <= _ref3; g = _j += 1) {
          for (b = _k = _ref4 = cbox.b1, _ref5 = cbox.b2; _k <= _ref5; b = _k += 1) {
            index = getColorIndex(r, g, b);
            sum += histo[index] || 0;
          }
        }
        total += sum;
        partialsum[r] = total;
      }
    } else if (maxw === gw) {
      for (g = _l = _ref6 = cbox.g1, _ref7 = cbox.g2; _l <= _ref7; g = _l += 1) {
        sum = 0;
        for (r = _m = _ref8 = cbox.r1, _ref9 = cbox.r2; _m <= _ref9; r = _m += 1) {
          for (b = _n = _ref10 = cbox.b1, _ref11 = cbox.b2; _n <= _ref11; b = _n += 1) {
            index = getColorIndex(r, g, b);
            sum += histo[index] || 0;
          }
        }
        total += sum;
        partialsum[g] = total;
      }
    } else {
      for (b = _o = _ref12 = cbox.b1, _ref13 = cbox.b2; _o <= _ref13; b = _o += 1) {
        sum = 0;
        for (r = _p = _ref14 = cbox.r1, _ref15 = cbox.r2; _p <= _ref15; r = _p += 1) {
          for (g = _q = _ref16 = cbox.g1, _ref17 = cbox.g2; _q <= _ref17; g = _q += 1) {
            index = getColorIndex(r, g, b);
            sum += histo[index] || 0;
          }
        }
        total += sum;
        partialsum[b] = total;
      }
    }
    partialsum.forEach(function(d, i) {
      return lookaheadsum[i] = total - d;
    });
    doCut = function(color) {
      var cbox1, cbox2, count2, d2, dim1, dim2, i, left, right, _r, _ref18, _ref19;
      dim1 = color + '1';
      dim2 = color + '2';
      for (i = _r = _ref18 = cbox[dim1], _ref19 = cbox[dim2]; _r <= _ref19; i = _r += 1) {
        if (partialsum[i] > (total / 2)) {
          cbox1 = cbox.copy();
          cbox2 = cbox.copy();
          left = i - cbox[dim1];
          right = cbox[dim2] - i;
          if (left <= right) {
            d2 = Math.min(cbox[dim2] - 1, ~~(i + right / 2));
          } else {
            d2 = Math.max(cbox[dim1], ~~(i - 1 - left / 2));
          }
          while (!partialsum[d2]) {
            d2++;
          }
          count2 = lookaheadsum[d2];
          while (!count2 && partialsum[d2 - 1]) {
            count2 = lookaheadsum[--d2];
          }
          cbox1[dim2] = d2;
          cbox2[dim1] = cbox1[dim2] + 1;
          // console.log("cbox counts: " + (cbox.count()) + ", " + (cbox1.count()) + ", " + (cbox2.count()));
          return [cbox1, cbox2];
        }
      }
    };
    if (maxw === rw) {
      return doCut("r");
    }
    if (maxw === gw) {
      return doCut("g");
    }
    if (maxw === bw) {
      return doCut("b");
    }
  };

  MMCQ.prototype.quantize = function(pixels, maxcolors) {
    var cbox, cmap, histo, iter, pq, pq2,
      _this = this;
    if ((!pixels.length) || (maxcolors < 2) || (maxcolors > 256)) {
      console.log("invalid arguments");
      return false;
    }
    histo = getHisto(pixels);
    cbox = cboxFromPixels(pixels, histo);
    pq = new PriorityQueue(function(a, b) {
      var va, vb;
      va = a.count();
      vb = b.count();
      if (va > vb) {
        return 1;
      } else if (va < vb) {
        return -1;
      } else {
        return 0;
      }
    });
    pq.push(cbox);
    iter = function(lh, target) {
      var cbox1, cbox2, cboxes, ncolors, niters;
      ncolors = 1;
      niters = 0;
      while (niters < _this.maxIterations) {
        cbox = lh.pop();
        if (!cbox.count()) {
          lh.push(cbox);
          niters++;
          continue;
        }
        cboxes = medianCutApply(histo, cbox);
        cbox1 = cboxes[0];
        cbox2 = cboxes[1];
        if (!cbox1) {
          console.log("cbox1 not defined; shouldn't happen");
          return;
        }
        lh.push(cbox1);
        if (cbox2) {
          lh.push(cbox2);
          ncolors++;
        }
        if (ncolors >= target) {
          return;
        }
        if ((niters++) > _this.maxIterations) {
          console.log("infinite loop; perhaps too few pixels");
          return;
        }
      }
    };
    iter(pq, this.fractByPopulations * maxcolors);
    pq2 = new PriorityQueue(function(a, b) {
      var va, vb;
      va = a.count() * a.volume();
      vb = b.count() * b.volume();
      if (va > vb) {
        return 1;
      } else if (va < vb) {
        return -1;
      } else {
        return 0;
      }
    });
    while (pq.size()) {
      pq2.push(pq.pop());
    }
    iter(pq2, maxcolors - pq2.size());
    cmap = new ColorMap;
    while (pq2.size()) {
      cmap.push(pq2.pop());
    }
    return cmap;
  };

  return MMCQ;

}).call(this);

// Generated by CoffeeScript 1.6.3
(function() {
  window.ColorExtract = (function() {
    function ColorExtract() {}

    ColorExtract.getColorMap = function(canvas, sx, sy, w, h, nc) {
      var index, indexBase, pdata, pixels, x, y, _i, _j, _ref, _ref1;
      if (nc == null) {
        nc = 8;
      }
      pdata = canvas.getContext("2d").getImageData(sx, sy, w, h).data;
      pixels = [];
      for (y = _i = sy, _ref = sy + h; _i < _ref; y = _i += 1) {
        indexBase = y * w * 4;
        for (x = _j = sx, _ref1 = sx + w; _j < _ref1; x = _j += 1) {
          index = indexBase + (x * 4);
          pixels.push([pdata[index], pdata[index + 1], pdata[index + 2]]);
        }
      }
      return (new MMCQ).quantize(pixels, nc);
    };

    ColorExtract.colorDist = function(a, b) {
      var square;
      square = function(n) {
        return n * n;
      };
      return square(a[0] - b[0]) + square(a[1] - b[1]) + square(a[2] - b[2]);
    };

    ColorExtract.extract = function(image, canvas, callback) {
      var bgColor, bgColorMap, bgPalette, color, dist, fgColor, fgColor2, fgColorMap, fgPalette, maxDist, rgbToCssString, _i, _j, _len, _len1;
      canvas.width = 25;
      canvas.height = 25;
      canvas.getContext("2d").drawImage(image, 0, 0, canvas.width, canvas.height);
      bgColorMap = ColorExtract.getColorMap(canvas, 0, 0, canvas.width, canvas.height, 4);
      bgPalette = bgColorMap.cboxes.map(function(cbox) {
        return {
          count: cbox.cbox.count(),
          rgb: cbox.color
        };
      });
      bgPalette.sort(function(a, b) {
        return b.count - a.count;
      });
      bgColor = bgPalette[0].rgb;
      fgColorMap = ColorExtract.getColorMap(canvas, 0, 0, image.width, image.height, 10);
      fgPalette = fgColorMap.cboxes.map(function(cbox) {
        return {
          count: cbox.cbox.count(),
          rgb: cbox.color
        };
      });
      fgPalette.sort(function(a, b) {
        return b.count - a.count;
      });
      maxDist = 0;
      for (_i = 0, _len = fgPalette.length; _i < _len; _i++) {
        color = fgPalette[_i];
        dist = ColorExtract.colorDist(bgColor, color.rgb);
        if (dist > maxDist) {
          maxDist = dist;
          fgColor = color.rgb;
        }
      }
      maxDist = 0;
      for (_j = 0, _len1 = fgPalette.length; _j < _len1; _j++) {
        color = fgPalette[_j];
        dist = ColorExtract.colorDist(bgColor, color.rgb);
        if (dist > maxDist && color.rgb !== fgColor) {
          maxDist = dist;
          fgColor2 = color.rgb;
        }
      }
      rgbToCssString = function(color) {
        return "rgb(" + color[0] + ", " + color[1] + ", " + color[2] + ")";
      };
      return callback({
        bgColor: rgbToCssString(bgColor),
        fgColor: rgbToCssString(fgColor),
        fgColor2: rgbToCssString(fgColor2)
      });
    };

    return ColorExtract;

  })();

}).call(this);

/**
 * placeholder - HTML5 input placeholder polyfill
 * Copyright (c) 2012 DIY Co
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this
 * file except in compliance with the License. You may obtain a copy of the License at:
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software distributed under
 * the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
 * ANY KIND, either express or implied. See the License for the specific language
 * governing permissions and limitations under the License.
 *
 * @author Brian Reavis <brian@thirdroute.com>
 */

(function($) {
  var NATIVE_SUPPORT = ('placeholder' in document.createElement('input'));
  var CSS_PROPERTIES = [
    '-moz-box-sizing', '-webkit-box-sizing', 'box-sizing',
    'padding-top', 'padding-right', 'padding-bottom', 'padding-left',
    'margin-top', 'margin-right', 'margin-bottom', 'margin-left',
    'border-top-width', 'border-right-width', 'border-bottom-width', 'border-left-width',
    'line-height', 'font-size', 'font-family', 'width', 'height',
    'top', 'left', 'right', 'bottom'
  ];

  var setupPlaceholder = function(input, options) {
    var i, evt, text, styles, zIndex, marginTop, dy, attrNode;
    var $input = $(input), $placeholder;

    try {
      attrNode = $input[0].getAttributeNode('placeholder');
      if (!attrNode) return;
      text = $input[0].getAttribute('placeholder');
      if (!text || !text.length) return;
      $input[0].setAttribute('placeholder', '');
      $input.data('placeholder', text);
    } catch (e) {
      return;
    }

    // enumerate textbox styles for mimicking
    styles = {};
    for (i = 0; i < CSS_PROPERTIES.length; i++) {
      styles[CSS_PROPERTIES[i]] = $input.css(CSS_PROPERTIES[i]);
    }
    zIndex = parseInt($input.css('z-index'), 10);
    if (isNaN(zIndex) || !zIndex) zIndex = 1;

    // create the placeholder
    $placeholder = $('<span>').addClass('placeholder').html(text);
    $placeholder.css(styles);
    $placeholder.css({
      'cursor': $input.css('cursor') || 'text',
      'display': 'block',
      'position': 'absolute',
      'overflow': 'hidden',
      'z-index': zIndex + 1,
      'background': 'none',
      'border-top-style': 'solid',
      'border-right-style': 'solid',
      'border-bottom-style': 'solid',
      'border-left-style': 'solid',
      'border-top-color': 'transparent',
      'border-right-color': 'transparent',
      'border-bottom-color': 'transparent',
      'border-left-color': 'transparent'
    });
    $placeholder.insertBefore($input);

    // compensate for y difference caused by absolute / relative difference (line-height factor)
    dy = $input.offset().top - $placeholder.offset().top;
    marginTop = parseInt($placeholder.css('margin-top'));
    if (isNaN(marginTop)) marginTop = 0;
    $placeholder.css('margin-top', marginTop + dy);

    // event handlers + add to document
    $placeholder.on('mousedown', function() {
      if (!$input.is(':enabled')) return;
      window.setTimeout(function(){
        $input.trigger('focus');
      }, 0);
    });

    function togglePlaceholderForInput() {
      $placeholder.toggle(!$.trim($input.val()).length);
    }

    $input.on('focus.placeholder', function() {
      $placeholder.hide();
    });
    $input.on('blur.placeholder', function() {
      togglePlaceholderForInput();
    });

    $input[0].onpropertychange = function() {
      if (event.propertyName === 'value') {
        togglePlaceholderForInput();
      }
    };

    $input.trigger('blur.placeholder');
  };

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  $.fn.placeholder = function(options) {
    var $this = this;
    options = options || {};

    if (NATIVE_SUPPORT && !options.force) {
      return this;
    }

    window.setTimeout(function() {
      $this.each(function() {
        var tagName = this.tagName.toLowerCase();
        if (tagName === 'input' || tagName === 'textarea') {
          setupPlaceholder(this, options);
        }
      });
    }, 0);

    return this;
  };

})(jQuery);

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
    bindSiteSearch: bindSiteSearch
  });

init();
})(jQuery);

// requestAnimationFrame polyfill by Erik Möller. fixes from Paul Irish and Tino Zijdel
// MIT license
(function() {
  var lastTime = 0;
  var vendors = ['ms', 'moz', 'webkit', 'o'];
  for(var x = 0; x < vendors.length && !window.requestAnimationFrame; ++x) {
    window.requestAnimationFrame = window[vendors[x]+'RequestAnimationFrame'];
    window.cancelAnimationFrame = window[
      vendors[x]+'CancelAnimationFrame'
    ] || window[
      vendors[x]+'CancelRequestAnimationFrame'
    ];
  }

  if (!window.requestAnimationFrame)
    window.requestAnimationFrame = function(callback, element) {
      var currTime = new Date().getTime();
      var timeToCall = Math.max(0, 16 - (currTime - lastTime));
      var id = window.setTimeout(function() { callback(currTime + timeToCall); },
        timeToCall);
      lastTime = currTime + timeToCall;
      return id;
    };

  if (!window.cancelAnimationFrame)
    window.cancelAnimationFrame = function(id) {
      clearTimeout(id);
    };
}());
