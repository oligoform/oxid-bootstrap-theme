[{assign var="currency" value=$oView->getActCurrency()}]
<div class="panel panel-default" [{if $_boxId}]id="[{$_boxId}]"[{/if}]>
    [{if $_sHeaderIdent}]
        <div class="panel-heading [{if $_sHeaderCssClass}] [{$_sHeaderCssClass}][{/if}]">
            [{oxmultilang ident=$_sHeaderIdent}]
            [{assign var='rsslinks' value=$oView->getRssLinks()}]
            [{if $rsslinks.topArticles}]
                <a class="rss-link" data-toggle="tooltip" data-placement="left" id="rssTopProducts" href="[{$rsslinks.topArticles.link}]" title="[{$rsslinks.topArticles.title}]">
                    <i class="fa fa-rss"></i>
                </a>
                [{oxscript add="(function(\$){\$('#rssTopProducts').tooltip();})(window.jQuery);"}]
            [{/if}]
        </div>
    [{/if}]
    <div class="panel-body">
        <div class="panel-group" id="article-accordion">
            [{foreach from=$_oBoxProducts item=_oBoxProduct name=_sProdList}]
                [{assign var="iProdIndex" value=$smarty.foreach._sProdList.index}]
                [{oxid_include_widget cl="oxwArticleBox" _parent=$oView->getClassName() _navurlparams=$oViewConf->getNavUrlParams() iLinkType=$_oBoxProduct->getLinkType() _object=$_oBoxProduct anid=$_oBoxProduct->getId() isVatIncluded=$oView->isVatIncluded() iProdIndex=$iProdIndex nocookie=1 sWidgetType=product sListType=boxproduct inlist=$_oBoxProduct->isInList() skipESIforUser=1}]
            [{/foreach}]
        </div>
    </div>
</div>