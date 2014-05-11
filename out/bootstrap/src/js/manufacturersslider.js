(function ($) {
    function checkSupport(elemname, pluginname) {
        return (elemname.length && pluginname) ? true : false;
    }

    var  brandSlider = $('div.brand-slider.owl-carousel');
    if (checkSupport(brandSlider, $.fn.owlCarousel)) {
        brandSlider.owlCarousel({
            items: 6,
            itemsDesktop : [1199,5],
            itemsDesktopSmall: [979,4],
            itemsTablet: [768,2],
            itemsMobile : [479,1],
            slideSpeed: 600,
            autoPlay: 10000,
            stopOnHover: true,
            navigation: false,
            pagination: false,
            responsive: true,
            autoHeight : true
        }).data('navigationBtns', ['#brand-slider-prev', '#brand-slider-next']);

        $("#brand-slider-prev").on('click', function(e) {
            e.preventDefault();
            brandSlider.trigger('owl.prev');
        });

        $("#brand-slider-next").on('click', function(e) {
            e.preventDefault();
            brandSlider.trigger('owl.next');
        });
    }
})(window.jQuery);