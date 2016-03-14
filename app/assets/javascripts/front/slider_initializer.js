jQuery(document).ready(
  function() {
    var slider = new XPRO.Controls.Slider(null);
    slider.initSlider("scroller", {
      "mode"              : "fade",
      "iniWidth"          : 1200,
      "iniHeight"         : 300,
      "autoRun"           : false,
      "interval"          : 15000,
      "autoHeightMode"    : "maintainratio",
      "thumbnails"        : {"navigation": false,
                             "thumb_type": "bullet"},
      "stopOnHover"       : false,
      "imageVAlign"       : "bottom",
      "showProgress"      : true
    });

    jQuery(".layer-action-link").on("click", function() {
      slider.forward();
      return false;
    });
  }
);
