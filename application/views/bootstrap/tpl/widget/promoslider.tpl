[{assign var=oBanners value=$oView->getBanners() }]
[{if $oBanners|@count}]
    <div id="carousel-promoslider" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            [{section name=i start=0 loop=$oBanners|@count}]
            <li data-target="#carousel-promoslider" data-slide-to="[{$smarty.section.i.index}]" [{if $smarty.section.i.index == 0}]class="active"[{/if}]></li>
            [{/section}]
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            [{assign var="currency" value=$oView->getActCurrency()}]
            [{foreach from=$oBanners item=oBanner name=oBannerLoop}]
                [{assign var=sBannerLink value=$oBanner->getBannerLink()}]
                [{assign var=oArticle value=$oBanner->getBannerArticle()}]
                <div class="item [{if $smarty.foreach.oBannerLoop.index == 0}]active[{/if}]">
                    [{if $sBannerLink}]<a href="[{$sBannerLink}]">[{/if}]
                    <img src="[{$oBanner->getBannerPictureUrl()}]" alt="[{$oBanner->oxactions__oxtitle->value}]">
                    [{if $sBannerLink}]</a>[{/if}]
                    [{if $oArticle}]
                        [{assign var="sFrom" value=""}]
                        [{assign var="oPrice" value=$oArticle->getPrice()}]
                        [{if $oArticle->isParentNotBuyable()}]
                            [{assign var="oPrice" value=$oArticle->getVarMinPrice()}]
                            [{if $oArticle->isRangePrice() }]
                                [{assign var="sFrom" value="PRICE_FROM"|oxmultilangassign}]
                            [{/if}]
                        [{/if}]
                        <div class="carousel-caption">
                            <h3>[{$oArticle->oxarticles__oxtitle->value}]</h3>
                            <p>[{$sFrom}] [{oxprice price=$oPrice currency=$currency}]</p>
                        </div>
                    [{/if}]
                </div>
            [{/foreach}]
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#carousel-promoslider" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
        </a>
        <a class="right carousel-control" href="#carousel-promoslider" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
        </a>
    </div>
[{/if}]
