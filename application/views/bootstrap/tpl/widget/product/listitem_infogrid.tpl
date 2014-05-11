[{block name="widget_product_listitem_infogrid"}]
    [{assign var="product" value=$oView->getProduct()}]
    [{assign var="owishid" value=$oView->getWishId()}]
    [{assign var="toBasketFunction" value=$oView->getToBasketFunction()}]
    [{assign var="recommid" value=$oView->getRecommId()}]
    [{assign var="showMainLink" value=$oView->getShowMainLink()}]
    [{assign var="blDisableToCart" value=$oView->getDisableToCart()}]
    [{assign var="iIndex" value=$oView->getIndex()}]
    [{assign var="altproduct" value=$oView->getAltProduct()}]

    [{if $showMainLink}]
        [{assign var='_productLink' value=$product->getMainLink()}]
    [{else}]
        [{assign var='_productLink' value=$product->getLink()}]
    [{/if}]
    [{assign var="aVariantSelections" value=$product->getVariantSelections(null,null,1)}]
    [{assign var="blShowToBasket" value=true}] [{* tobasket or more info ? *}]
    [{if $blDisableToCart || $product->isNotBuyable()||($aVariantSelections&&$aVariantSelections.selections)||$product->hasMdVariants()||($oViewConf->showSelectListsInList() && $product->getSelections(1))||$product->getVariants()}]
        [{assign var="blShowToBasket" value=false}]
    [{/if}]

    <form name="tobasket[{$iIndex}]" [{if $blShowToBasket}]action="[{$oViewConf->getSelfActionLink()}]" method="post"[{else}]action="[{$_productLink}]" method="get"[{/if}]>
        [{$oViewConf->getNavFormParams()}]
        [{$oViewConf->getHiddenSid()}]
        <input type="hidden" name="pgNr" value="[{$oView->getActPage()}]">
        [{if $recommid}]
            <input type="hidden" name="recommid" value="[{$recommid}]">
        [{/if}]
        [{if $blShowToBasket}]
            [{oxhasrights ident="TOBASKET"}]
                <input type="hidden" name="cl" value="[{$oViewConf->getTopActiveClassName()}]">
            [{if $owishid}]
                <input type="hidden" name="owishid" value="[{$owishid}]">
            [{/if}]
            [{if $toBasketFunction}]
                <input type="hidden" name="fnc" value="[{$toBasketFunction}]">
            [{else}]
                <input type="hidden" name="fnc" value="tobasket">
            [{/if}]
                <input type="hidden" name="aid" value="[{$product->oxarticles__oxid->value}]">
            [{if $altproduct}]
                <input type="hidden" name="anid" value="[{$altproduct}]">
            [{else}]
                <input type="hidden" name="anid" value="[{$product->oxarticles__oxnid->value}]">
            [{/if}]
                <input type="hidden" name="am" value="1">
            [{/oxhasrights}]
        [{else}]
            <input type="hidden" name="cl" value="details">
            <input type="hidden" name="anid" value="[{$product->oxarticles__oxnid->value}]">
        [{/if}]

        <div class="listDetails clearfix">

            [{block name="widget_product_listitem_infogrid_gridpicture"}]
                <div class="infogrid-picture">
                    <a href="[{$_productLink}]" title="[{ $product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]">
                        <img src="[{$product->getThumbnailUrl()}]" alt="[{ $product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]" class="img-thumbnail">
                    </a>
                </div>
            [{/block}]

            [{block name="widget_product_listitem_infogrid_titlebox"}]
                <h4>
                    <a id="[{$iIndex}]" href="[{$_productLink}]" class="title" title="[{ $product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]">
                       [{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]
                    </a>
                </h4>
            [{/block}]

            [{block name="widget_product_listitem_infogrid_selections"}]
                [{if $aVariantSelections && $aVariantSelections.selections }]
                    <div id="variantselector_[{$iIndex}]" class="selectorsBox js-fnSubmit clear">
                        [{foreach from=$aVariantSelections.selections item=oSelectionList key=iKey}]
                            [{include file="widget/product/selectbox.tpl" oSelectionList=$oSelectionList}]
                        [{/foreach}]
                    </div>
                [{elseif $oViewConf->showSelectListsInList()}]
                    [{assign var="oSelections" value=$product->getSelections(1)}]
                    [{if $oSelections}]
                        <div id="selectlistsselector_[{$iIndex}]" class="selectorsBox js-fnSubmit clear">
                            [{foreach from=$oSelections item=oList name=selections}]
                                [{include file="widget/product/selectbox.tpl" oSelectionList=$oList sFieldName="sel" iKey=$smarty.foreach.selections.index blHideDefault=true sSelType="seldrop" sJsAction="js-fnSubmit"}]
                            [{/foreach}]
                        </div>
                    [{/if}]
                [{/if}]
            [{/block}]

            [{if $oViewConf->getShowCompareList()}]
                <div>[{oxid_include_dynamic file="widget/product/compare_links.tpl" testid="_`$iIndex`" type="compare" aid=$product->oxarticles__oxid->value anid=$altproduct in_list=$product->isOnComparisonList() page=$oView->getActPage()}]</div>
            [{/if}]

            [{* Start show price *}]
            [{block name="widget_product_listitem_infogrid_price"}]

                [{oxhasrights ident="SHOWARTICLEPRICE"}]
                    <div class="price-box">
                        [{if $product->getTPrice()}]
                            [{oxmultilang ident="REDUCED_FROM_2"}] <del>[{oxprice price=$product->getTPrice() currency=$oView->getActCurrency()}]</del>
                        [{/if}]
                        [{block name="widget_product_listitem_infogrid_price_value"}]
                            [{if $product->getPrice()}]
                                <span class="label label-primary">
                                <span>
                                    [{if $product->isRangePrice()}]
                                        [{oxmultilang ident="PRICE_FROM"}]
                                        [{if !$product->isParentNotBuyable() }]
                                            [{assign var="oPrice" value=$product->getMinPrice()}]
                                        [{else}]
                                            [{assign var="oPrice" value=$product->getVarMinPrice()}]
                                        [{/if}]
                                    [{else}]
                                        [{if !$product->isParentNotBuyable()}]
                                            [{assign var="oPrice" value=$product->getPrice()}]
                                        [{else}]
                                            [{assign var="oPrice" value=$product->getVarMinPrice()}]
                                        [{/if}]
                                    [{/if}]
                                 </span>
                                [{oxprice price=$oPrice currency=$oView->getActCurrency()}]
                                [{if $oView->isVatIncluded() }]
                                    [{if !($product->hasMdVariants() || ($oViewConf->showSelectListsInList() && $product->getSelections(1)) || $product->getVariants())}]*[{/if}]</span>
                                [{/if}]
                                </span>
                            [{/if}]
                        [{/block}]
                        [{if $product->getUnitPrice()}]
                            <span id="productPricePerUnit_[{$iIndex}]" class="label label-primary">
                                [{$product->getUnitQuantity()}] [{$product->getUnitName()}] | [{oxprice price=$product->getUnitPrice() currency=$oView->getActCurrency() }]/[{$product->getUnitName()}]
                            </span>
                        [{elseif $product->oxarticles__oxweight->value  }]
                            <span id="productPricePerUnit_[{$iIndex}]" class="label label-primary">
                                <span title="weight">[{oxmultilang ident="WEIGHT" suffix="COLON"}]</span>
                                <span class="value">[{$product->oxarticles__oxweight->value}] [{oxmultilang ident="KG"}]</span>
                            </span>
                        [{/if}]
                    </div>
                [{/oxhasrights}]
            [{/block}]
            [{* End show price *}]

            [{block name="widget_product_listitem_infogrid_tobasket"}]
                [{if $blShowToBasket }]
                    [{oxhasrights ident="TOBASKET"}]
                        <button type="submit" class="btn btn-primary">[{oxmultilang ident="TO_CART"}]</button>
                    [{/oxhasrights}]
                [{else}]
                    <a class="btn btn-primary" href="[{$_productLink}]" >[{oxmultilang ident="MORE_INFO"}]</a>
                [{/if}]
            [{/block}]
        </div>
    </form>
[{/block}]

[{oxscript widget=$oView->getClassName()}]
