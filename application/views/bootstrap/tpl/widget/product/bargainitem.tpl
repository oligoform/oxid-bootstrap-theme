[{assign var="_product" value=$oView->getProduct()}]
[{assign var="iIteration" value=$oView->getIteration()}]

[{assign var="sBargainArtTitle" value="`$_product->oxarticles__oxtitle->value` `$_product->oxarticles__oxvarselect->value`"}]
[{capture name="bargainTitle"}]
    <h4><a href="[{$_product->getMainLink()}]">[{$sBargainArtTitle|strip_tags}]</a></h4>
[{/capture}]
[{capture name="bargainPic"}]
    <div class="infogrid-picture">
        <a href="[{$_product->getMainLink()}]" title="[{$sBargainArtTitle|strip_tags}]">
            <img src="[{$_product->getThumbnailUrl()}]" alt="[{$sBargainArtTitle|strip_tags}]" class="img-thumbnail">
        </a>
    </div>
[{/capture}]
[{capture name="bargainPrice"}]
    [{block name="widget_product_bargainitem_price"}]
        <div>
            [{oxhasrights ident="SHOWARTICLEPRICE"}]
            [{if $_product->getTPrice()}]
                [{oxmultilang ident="REDUCED_FROM_2"}] <del>[{oxprice price=$_product->getTPrice() currency=$oView->getActCurrency()}]</del>
            [{/if}]
            [{if $_product->getPrice()}]
                [{assign var="sFrom" value=""}]
                [{assign var="oPrice" value=$_product->getPrice()}]
                [{if $_product->isParentNotBuyable() }]
                    [{assign var="oPrice" value=$_product->getVarMinPrice()}]
                    [{if $_product->isRangePrice() }]
                        [{assign var="sFrom" value="PRICE_FROM"|oxmultilangassign}]
                    [{/if}]
                [{/if}]
                <span class="label label-primary">
                    [{$sFrom}] [{oxprice price=$oPrice currency=$oView->getActCurrency()}]
                    [{if $oView->isVatIncluded() }]
                        [{if !( $_product->getVariantsCount() || $_product->hasMdVariants() || ($oViewConf->showSelectListsInList()&&$_product->getSelections(1)) )}]*[{/if}]
                    [{/if}]
                </span>
            [{/if}]
            [{if $_product->getUnitPrice()}]
                <span class="label label-primary">
                    [{$_product->getUnitQuantity()}] [{$_product->getUnitName()}] | [{oxprice price=$_product->getUnitPrice() currency=$oView->getActCurrency()}]/[{$_product->getUnitName()}]
                </span>
            [{/if}]
            [{/oxhasrights}]
        </div>
    [{/block}]
[{/capture}]
[{capture name="bargainToBasket"}]
    [{oxhasrights ident="SHOWARTICLEPRICE"}]
    [{block name="widget_product_bargainitem_tobasket"}]
        <div>
            [{if !( $_product->getVariantsCount() || $_product->hasMdVariants() || ($oViewConf->showSelectListsInList() && $_product->getSelections(1)) )}]
                <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=start" params="fnc=tobasket&amp;aid=`$_product->oxarticles__oxid->value`&amp;am=1"}]" class="btn btn-primary" title="[{oxmultilang ident="TO_CART"}]">
                    [{oxmultilang ident="TO_CART"}]
                </a>
            [{else}]
                <a href="[{$_product->getMainLink()}]" class="btn btn-primary">
                    [{oxmultilang ident="MORE_INFO"}]
                </a>
            [{/if}]
        </div>
    [{/block}]
    [{/oxhasrights}]
[{/capture}]
<div class="panel panel-default">
    <div class="panel-heading">
        [{oxmultilang ident="WEEK_SPECIAL"}]
        [{assign var="rsslinks" value=$oView->getRSSLinks()}]
        [{if $rsslinks.bargainArticles}]
            <a class="rss-link" id="rssBargainProducts" href="[{$rsslinks.bargainArticles.link}]" title="[{$rsslinks.bargainArticles.title}]">
                <i class="fa fa-rss"></i>
            </a>
        [{/if}]
    </div>
    <div class="panel-body">
        [{$smarty.capture.bargainPic}]
        [{$smarty.capture.bargainTitle}]
        [{$smarty.capture.bargainPrice}]
        [{$smarty.capture.bargainToBasket}]
    </div>
</div>

[{oxscript widget=$oView->getClassName()}]