[{if !$type}]
    [{assign var="type" value="infogrid"}]
[{/if}]

[{if $head}]
    [{if $header eq "light"}]
        <h3>[{$head}]</h3>
    [{else}]
        <h2>
            [{$head}]
            [{if $rsslink}]
                <a data-toggle="tooltip" data-placement="top" id="[{$rssId}]" href="[{$rsslink.link}]" title="[{$rsslink.title}]">
                    <i class="fa fa-rss"></i>
                </a>
                [{oxscript add="(function(\$){\$('#$rssId').tooltip();})(window.jQuery);"}]
            [{/if}]
        </h2>
    [{/if}]
[{/if}]
[{if $products|@count gt 0}]
    <div class="row">
        [{assign var="currency" value=$oView->getActCurrency()}]
        [{foreach from=$products item=_product name=productlist}]
            [{assign var="_sTestId" value=$listId|cat:"_"|cat:$smarty.foreach.productlist.iteration}]
            [{if ($type eq "infogrid" AND ($smarty.foreach.productlist.iteration % 2 == 0 ))}]<div class="row">[{/if}]
            <div [{if $type eq "infogrid"}]class="col-md-6"[{/if}]>
                [{oxid_include_widget cl="oxwArticleBox" _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() iLinkType=$_product->getLinkType() _object=$_product anid=$_product->getId() sWidgetType=product sListType=listitem_$type iIndex=$_sTestId blDisableToCart=$blDisableToCart isVatIncluded=$oView->isVatIncluded() showMainLink=$showMainLink recommid=$recommid owishid=$owishid toBasketFunction=$toBasketFunction removeFunction=$removeFunction altproduct=$altproduct inlist=$_product->isInList() skipESIforUser=1}]
            </div>
            [{if ($type eq "infogrid" AND ($smarty.foreach.productlist.iteration % 2 == 0 ))}]</div>[{/if}]
        [{/foreach}]
    </div>
[{/if}]