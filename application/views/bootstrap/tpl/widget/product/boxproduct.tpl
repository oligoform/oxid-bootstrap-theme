[{assign var="_oBoxProduct" value=$oView->getProduct()}]
[{assign var="_sTitle" value="`$_oBoxProduct->oxarticles__oxtitle->value` `$_oBoxProduct->oxarticles__oxvarselect->value`"|strip_tags}]

<div class="panel panel-default">
    <div id="article-accordion-collapse-[{$iProdIndex}]" class="panel-collapse collapse [{if $iProdIndex == 0}]in[{/if}]">
        <div class="panel-body text-center">
            [{block name="widget_product_boxproduct_image"}]
                <a href="[{$_oBoxProduct->getMainLink()}]">
                    <img src="[{$_oBoxProduct->getIconUrl()}]" alt="[{$_sTitle}]">
                </a>
            [{/block}]
        </div>
    </div>
    <div class="panel-heading">
        [{block name="widget_product_boxproduct_price"}]
            <div class="panel-title">
                <a data-toggle="collapse" data-parent="#article-accordion" href="#article-accordion-collapse-[{$iProdIndex}]">
                    [{$_sTitle}]
                    [{oxhasrights ident="SHOWARTICLEPRICE"}]
                    [{if $_oBoxProduct->getPrice()}]
                        <strong> [{if $_oBoxProduct->isRangePrice()}]
                                [{ oxmultilang ident="PRICE_FROM" }]
                                [{if !$_oBoxProduct->isParentNotBuyable() }]
                                    [{assign var="oPrice" value=$_oBoxProduct->getMinPrice() }]
                                [{else}]
                                    [{assign var="oPrice" value=$_oBoxProduct->getVarMinPrice() }]
                                [{/if}]
                            [{else}]
                                [{if !$_oBoxProduct->isParentNotBuyable() }]
                                    [{assign var="oPrice" value=$_oBoxProduct->getPrice() }]
                                [{else}]
                                    [{assign var="oPrice" value=$_oBoxProduct->getVarMinPrice() }]
                                [{/if}]
                            [{/if}]
                            [{oxprice price=$oPrice currency=$oView->getActCurrency()}]
                            [{if $oView->isVatIncluded() }]
                                [{if !( $_oBoxProduct->getVariantsCount() || $_oBoxProduct->hasMdVariants() || ($oViewConf->showSelectListsInList()&&$_oBoxProduct->getSelections(1)) )}]*[{/if}]
                            [{/if}]
                        </strong>
                    [{/if}]
                    [{/oxhasrights}]
                </a>
            </div>
        [{/block}]
    </div>
</div>

[{oxscript widget=$oView->getClassName()}]