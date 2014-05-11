[{block name="widget_header_search_form"}]
    [{if $oView->showSearch()}]
        <form class="navbar-form navbar-right" action="[{$oViewConf->getSelfActionLink()}]" method="get" name="search">
            [{$oViewConf->getHiddenSid()}]
            <input type="hidden" name="cl" value="search">
            <div class="form-group">
                [{block name="header_search_field"}]
                    <input type="text" class="form-control" name="searchparam" placeholder="[{oxmultilang ident="SEARCH"}]" value="[{$oView->getSearchParamForHtml()}]">
                [{/block}]
            </div>
            <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
        </form>
    [{/if}]
[{/block}]