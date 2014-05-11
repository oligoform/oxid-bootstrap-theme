<li class="dropdown">
    [{if $oxcmp_user}]
        [{assign var="noticeListCount" value=$oxcmp_user->getNoticeListArtCnt()}]
        [{assign var="wishListCount" value=$oxcmp_user->getWishListArtCnt()}]
        [{assign var="recommListCount" value=$oxcmp_user->getRecommListsCount()}]
    [{else}]
        [{assign var="noticeListCount" value="0"}]
        [{assign var="wishListCount" value="0"}]
        [{assign var="recommListCount" value="0"}]
    [{/if}]
    [{math equation="a+b+c+d" a=$oView->getCompareItemsCnt() b=$noticeListCount c=$wishListCount d=$recommListCount assign=notificationsCounter}]
    [{block name="widget_header_servicebox_flyoutbox"}]
        <a href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account"}]" class="dropdown-toggle" data-toggle="dropdown">
            [{oxmultilang ident="ACCOUNT"}] [{if $notificationsCounter > 0}]<span class="badge">[{$notificationsCounter}]</span>[{/if}]
        </a>
        <ul class="dropdown-menu">
            [{block name="widget_header_servicebox_items"}]
                <li><a href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account"}]" rel="nofollow">[{oxmultilang ident="MY_ACCOUNT"}]</a></li>
                <li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_order"}]" rel="nofollow">[{oxmultilang ident="MY_ORDER_HISTORY"}]</a></li>
                [{if $oViewConf->getShowCompareList() }]
                    <li>
                        <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=compare"}]" rel="nofollow">
                            [{oxmultilang ident="MY_PRODUCT_COMPARISON"}]
                            [{if $oView->getCompareItemsCnt()}]<span class="badge">[{$oView->getCompareItemsCnt()}]</span>[{/if}]
                        </a>
                    </li>
                    [{if $oView->getCompareItemsCnt()}]
                        [{oxscript include='js/widgets/oxcomparelinks.js'}]
                        [{oxscript add="(function(\$){oxCompareLinks.updateLinks("|cat:$oView->getCompareItems(true)|cat:");})(window.jQuery);"}]
                    [{/if}]
                [{/if}]
                <li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_noticelist"}]" rel="nofollow">[{oxmultilang ident="MY_WISH_LIST"}][{if $oxcmp_user && $oxcmp_user->getNoticeListArtCnt()}]<span class="badge">[{$oxcmp_user->getNoticeListArtCnt()}]</span>[{/if}]</a></li>
                [{if $oViewConf->getShowWishlist()}]
                    <li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_wishlist"}]" rel="nofollow">[{oxmultilang ident="MY_GIFT_REGISTRY"}][{if $oxcmp_user && $oxcmp_user->getWishListArtCnt()}]<span class="badge">[{$oxcmp_user->getWishListArtCnt()}]</span>[{/if}]</a></li>
                [{/if}]
                [{if $oViewConf->getShowListmania()}]
                    <li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_recommlist"}]" rel="nofollow">[{oxmultilang ident="MY_LISTMANIA"}][{if $oxcmp_user && $oxcmp_user->getRecommListsCount()}]<span class="badge">[{$oxcmp_user->getRecommListsCount()}]</span>[{/if}]</a></li>
                [{/if}]
                [{if $oViewConf->isFunctionalityEnabled( "blEnableDownloads" )}]
                    <li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_downloads"}]" rel="nofollow">[{oxmultilang ident="MY_DOWNLOADS"}]</a></li>
                [{/if}]
            [{/block}]
        </ul>
    [{/block}]
</li>