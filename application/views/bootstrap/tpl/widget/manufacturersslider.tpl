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
    <div id="brand-slider-container" class="carousel-wrapper">
        <header>
            <h2 class="page-header">Manufacturers</h2>
        </header>
        <div class="carousel-controls pull-right">
            <i id="brand-slider-prev" class="fa fa-chevron-left"></i>
            <i id="brand-slider-next" class="fa fa-chevron-right"></i>
        </div>
        <div class="sm-margin"></div><!-- space -->
        <div class="row">
            <div class="brand-slider owl-carousel">
                [{$smarty.capture.slides}]
            </div><!-- End .brand-slider -->
        </div><!-- End .row -->
    </div><!-- End #brand-slider-container -->
[{/if}]