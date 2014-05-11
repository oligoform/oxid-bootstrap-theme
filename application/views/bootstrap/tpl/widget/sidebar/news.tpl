<div class="panel panel-default">
    <div class="panel-heading">[{oxmultilang ident="NEWS"}]</div>
    <div class="panel-body">
        <ul class="list-unstyled">
            [{foreach from=$oNews item=_oNewsItem name=_sNewsList}]
                <li>
                    <p>[{$_oNewsItem->getLongDesc()|strip_tags|oxtruncate:100}]</p>
                    <p><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=news"}]#[{$_oNewsItem->oxnews__oxid->value}]">[{oxmultilang ident="MORE" suffix="ELLIPSIS"}]</a></p>
                </li>
            [{/foreach}]
        </ul>
    </div>
</div>