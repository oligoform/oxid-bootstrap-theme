[{capture name="slides"}]
    [{foreach from=$oView->getManufacturerForSlider() item=oManufacturer}]
        [{if $oManufacturer->oxmanufacturers__oxicon->value}]
            [{counter assign="slideCount"}]
            <a href="[{$oManufacturer->getLink()}]">
                <img src="[{$oManufacturer->getIconUrl()}]" alt="[{$oManufacturer->oxmanufacturers__oxtitle->value}]">
            </a>
        [{/if}]
    [{/foreach}]
[{/capture}]
[{if $slideCount > 6 }]
    [{oxstyle include="css/owl.carousel.css"}]
    [{oxstyle include="css/owl.transitions.css"}]
    [{oxstyle include="css/owl.theme.css"}]
    [{oxscript include="js/owl.carousel.min.js" priority=10}]
    [{oxscript include="js/manufacturersslider.js" priority=10}]
    <h2 class="page-header">Manufacturers</h2>
    <div id="brand-slider-container" class="carousel carousel-wrapper">
        <div class="row">
            <div class="brand-slider owl-carousel">
                [{$smarty.capture.slides}]
            </div><!-- End .brand-slider -->
        </div><!-- End .row -->
        <a class="left carousel-control" id="brand-slider-prev" href="#brand-slider-container">
            <span class="glyphicon glyphicon-chevron-left"></span>
        </a>
        <a class="right carousel-control" id="brand-slider-next" href="#brand-slider-container">
            <span class="glyphicon glyphicon-chevron-right"></span>
        </a>
    </div><!-- End #brand-slider-container -->
[{/if}]