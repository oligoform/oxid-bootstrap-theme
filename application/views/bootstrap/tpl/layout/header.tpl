[{if $oView->showBetaNote()}]
    [{oxid_include_widget cl="oxwBetaNote" noscript=1 nocookie=1}]
[{/if}]
[{if $oViewConf->getTopActionClassName() != 'clearcookies' && $oViewConf->getTopActionClassName() != 'mallstart'}]
    [{oxid_include_widget cl="oxwCookieNote" _parent=$oView->getClassName() nocookie=1}]
[{/if}]
<div class="header">
    [{if $oxcmp_user || $oView->getCompareItemCount() || $Errors.loginBoxErrors}]
        [{assign var="blAnon" value=0}]
        [{assign var="force_sid" value=$oView->getSidForWidget()}]
    [{else}]
        [{assign var="blAnon" value=1}]
    [{/if}]

    <ul class="nav nav-pills pull-right">
        [{oxid_include_widget cl="oxwServiceMenu" _parent=$oView->getClassName() force_sid=$force_sid nocookie=$blAnon _navurlparams=$oViewConf->getNavUrlParams() anid=$oViewConf->getActArticleId()}]
        [{oxid_include_widget cl="oxwLanguageList" lang=$oViewConf->getActLanguageId() _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() anid=$oViewConf->getActArticleId()}]
        [{oxid_include_widget cl="oxwCurrencyList" cur=$oViewConf->getActCurrency() _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() anid=$oViewConf->getActArticleId()}]
    </ul>
    <br class="clearfix">

    <div class="row">
        <div class="col-xs-8">
            [{assign var="sLogoImg" value=$oViewConf->getShopLogo()}]
            <a id="logo" href="[{$oViewConf->getHomeLink()}]" title="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]"><img src="[{$oViewConf->getImageUrl($sLogoImg)}]" alt="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]"></a>
        </div>
        <div class="col-xs-4 text-right">
            [{if $oxcmp_basket->getProductsCount()}]
                [{assign var="blAnon" value=0}]
                [{assign var="force_sid" value=$oView->getSidForWidget()}]
            [{else}]
                [{assign var="blAnon" value=1}]
            [{/if}]
            <div id="minibasket_container">
                [{oxid_include_widget cl="oxwMiniBasket" nocookie=$blAnon force_sid=$force_sid}]
            </div>
        </div>
    </div>

    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                [{oxid_include_widget cl="oxwCategoryTree" cnid=$oView->getCategoryId() sWidgetType="header" _parent=$oView->getClassName() nocookie=1}]
                [{include file="widget/header/search.tpl"}]
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</div>
[{if $oView->getClassName()=='start' && $oView->getBanners()|@count > 0 }]
    [{include file="widget/promoslider.tpl" }]
[{/if}]
