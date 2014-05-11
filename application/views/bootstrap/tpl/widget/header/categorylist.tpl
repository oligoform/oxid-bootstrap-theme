[{assign var="homeSelected" value="false"}]
[{if $oViewConf->getTopActionClassName() == 'start'}]
    [{assign var="homeSelected" value="true"}]
[{/if}]
[{assign var="oxcmp_categories" value=$oxcmp_categories}]

<ul class="nav navbar-nav">
    <li [{if $homeSelected == 'true'}]class="active"[{/if}]><a href="[{$oViewConf->getHomeLink()}]">[{oxmultilang ident="HOME"}]</a></li>

    [{assign var="iAllCatCount" value=$oxcmp_categories|count }]
    [{if $iAllCatCount > $oView->getTopNavigationCatCnt() }]
        [{assign var="bHasMore" value="true"}]
        [{assign var="iCatCnt" value="1"}]
    [{else}]
        [{assign var="bHasMore" value="false"}]
        [{assign var="iCatCnt" value="0"}]
    [{/if}]

    [{foreach from=$oxcmp_categories item=ocat key=catkey name=root}]
        [{if $ocat->getIsVisible() }]
            [{foreach from=$ocat->getContentCats() item=oTopCont name=MoreTopCms}]
                [{assign var="iCatCnt" value=$iCatCnt+1 }]
                [{assign var="iAllCatCount" value=$iAllCatCount+1 }]
                [{if !$bHasMore && ($iCatCnt >= $oView->getTopNavigationCatCnt()) }]
                    [{assign var="bHasMore" value="true"}]
                    [{assign var="iCatCnt" value=$iCatCnt+1}]
                [{/if}]

                [{if $iCatCnt <= $oView->getTopNavigationCatCnt()}]
                    <li><a href="[{$oTopCont->getLink()}]">[{$oTopCont->oxcontents__oxtitle->value}]</a></li>
                [{else}]
                    [{capture append="moreLinks"}]
                        <li><a href="[{$oTopCont->getLink()}]">[{$oTopCont->oxcontents__oxtitle->value}]</a></li>
                    [{/capture}]
                [{/if}]
            [{/foreach}]

            [{assign var="iCatCnt" value=$iCatCnt+1}]
            [{if !$bHasMore && ($iCatCnt >= $oView->getTopNavigationCatCnt())}]
                [{assign var="bHasMore" value="true"}]
                [{assign var="iCatCnt" value=$iCatCnt+1}]
            [{/if}]
            [{if $iCatCnt <= $oView->getTopNavigationCatCnt()}]
                <li class="[{if $ocat->getSubCats()}]dropdown[{/if}] [{if $homeSelected == 'false' && $ocat->expanded}]active[{/if}]">
                    <a [{if $ocat->getSubCats()}]class="dropdown-toggle" data-toggle="dropdown"[{/if}] href="[{$ocat->getLink()}]">[{$ocat->oxcategories__oxtitle->value}][{if $oView->showCategoryArticlesCount() && ($ocat->getNrOfArticles() > 0)}] ([{$ocat->getNrOfArticles()}])[{/if}]</a>
                    [{if $ocat->getSubCats()}]
                        <ul class="dropdown-menu">
                            [{foreach from=$ocat->getSubCats() item=osubcat key=subcatkey name=SubCat}]
                                [{if $osubcat->getIsVisible() }]
                                    [{foreach from=$osubcat->getContentCats() item=ocont name=MoreCms}]
                                        <li><a href="[{$ocont->getLink()}]">[{$ocont->oxcontents__oxtitle->value}]</a></li>
                                    [{/foreach}]
                                    [{if $osubcat->getIsVisible() }]
                                        <li [{if $homeSelected == 'false' && $osubcat->expanded}]class="active"[{/if}] ><a href="[{$osubcat->getLink()}]">[{$osubcat->oxcategories__oxtitle->value}] [{ if $oView->showCategoryArticlesCount() && ($osubcat->getNrOfArticles() > 0)}] ([{$osubcat->getNrOfArticles()}])[{/if}]</a></li>
                                    [{/if}]
                                [{/if}]
                            [{/foreach}]
                        </ul>
                    [{/if}]
                </li>
            [{else}]
                [{capture append="moreLinks"}]
                    <li [{if $homeSelected == 'false' && $ocat->expanded}]class="active"[{/if}]>
                        <a href="[{$ocat->getLink()}]">[{$ocat->oxcategories__oxtitle->value}][{ if $oView->showCategoryArticlesCount() && ($ocat->getNrOfArticles() > 0)}] ([{$ocat->getNrOfArticles()}])[{/if}]</a>
                    </li>
                [{/capture}]
            [{/if}]
        [{/if}]
    [{/foreach}]
    [{if $iAllCatCount > $oView->getTopNavigationCatCnt()}]
        <li class="dropdown">
            [{assign var="_catMoreUrl" value=$oView->getCatMoreUrl()}]
            <a class="dropdown-toggle" data-toggle="dropdown" href="[{oxgetseourl ident="`$_catMoreUrl`&amp;cl=alist"}]">[{oxmultilang ident="MORE"}]</a>
            <ul class="dropdown-menu">
                [{foreach from=$moreLinks item=link}]
                    [{$link}]
                [{/foreach}]
            </ul>
        </li>
    [{/if}]
</ul>
[{oxscript widget=$oView->getClassName()}]
[{oxstyle widget=$oView->getClassName()}]