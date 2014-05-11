[{assign var="oTagsManager" value=$oView->getTagCloudManager()}]
[{if $oView->getTagCloudManager()}]
    [{if $oView->displayInBox()}]
        [{* Display tags in separate box *}]
        <div class="panel panel-default">
            <div class="panel-heading">[{oxmultilang ident="TAGS"}]</div>
            <div class="panel-body">
    [{else}]
        <div class="categoryTagsBox">
            <h3>[{oxmultilang ident="TAGS"}]</h3>
            <div class="categoryTags">
    [{/if}]
    [{foreach from=$oTagsManager->getCloudArray() item=iCount key=sTagTitle}]
        <a class="tagitem_[{$oTagsManager->getTagSize($sTagTitle)}]" href="[{$oTagsManager->getTagLink($sTagTitle)}]">[{$oTagsManager->getTagTitle($sTagTitle)}]</a>
    [{/foreach}]
    [{if $oView->isMoreTagsVisible()}]
        <p><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=tags"}]">[{oxmultilang ident="MORE" suffix="ELLIPSIS"}]</a></p>
    [{/if}]
        </div>
    </div>
[{/if}]
