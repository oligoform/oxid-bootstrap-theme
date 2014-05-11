[{block name="footer_main"}]
    <div class="footer">

        [{* TODO: Refactor this place *}]
        <div class="row">
            <div class="col-xs-8">
                [{* TODO: Implement fblike widget
                [{block name="footer_fblike"}]
                    [{if $oView->isActive('FbLike') && $oViewConf->getFbAppId()}]
                        <div class="facebook" id="footerFbLike">
                            [{include file="widget/facebook/enable.tpl" source="widget/facebook/like.tpl" ident="#footerFbLike" parent="footer"}]
                        </div>
                    [{/if}]
                [{/block}]
                *}]
                [{if $oView->showNewsletter()}]
                    [{include file="widget/footer/newsletter.tpl"}]
                [{/if}]
            </div>
            <div class="col-xs-4 text-right">
                [{block name="footer_deliveryinfo"}]
                    [{oxifcontent ident="oxdeliveryinfo" object="oCont"}]
                        [{if $oView->isVatIncluded()}]
                            <a href="[{$oCont->getLink()}]" rel="nofollow">* [{oxmultilang ident="PLUS_SHIPPING"}] [{oxmultilang ident="PLUS_SHIPPING2"}]</a>
                        [{else}]
                            <a href="[{$oCont->getLink()}]" rel="nofollow">* [{oxmultilang ident="PLUS"}] [{oxmultilang ident="PLUS_SHIPPING2"}]</a>
                        [{/if}]
                    [{/oxifcontent}]
                [{/block}]
            </div>
        </div>

        <div class="row">
            [{* TODO: Refactor columns on small screens *}]
            [{assign var="iFooterColumns" value=2}]
            [{if $oView->getManufacturerlist()|count}]
                [{assign var="iFooterColumns" value=$iFooterColumns+1}]
            [{/if}]
            [{if $oxcmp_categories}]
                [{assign var="iFooterColumns" value=$iFooterColumns+1}]
            [{/if}]

            [{if $iFooterColumns == 3}]
                [{assign var="sFooterColumnClass" value="col-md-4 col-xs-6"}]
            [{elseif $iFooterColumns == 4}]
                [{assign var="sFooterColumnClass" value="col-md-3 col-xs-6"}]
            [{else}]
                [{assign var="sFooterColumnClass" value="col-xs-6"}]
            [{/if}]

            <div class="[{$sFooterColumnClass}]">[{oxid_include_widget cl="oxwServiceList" noscript=1 nocookie=1}]</div>
            <div class="[{$sFooterColumnClass}]">[{oxid_include_widget cl="oxwInformation" noscript=1 nocookie=1}]</div>
            <div class="[{$sFooterColumnClass}]">[{oxid_include_widget cl="oxwManufacturerList" _parent=$oView->getClassName() noscript=1 nocookie=1}]</div>
            <div class="[{$sFooterColumnClass}]">[{oxid_include_widget cl="oxwCategoryTree" _parent=$oView->getClassName() sWidgetType="footer" noscript=1 nocookie=1}]</div>
        </div>

        [{oxifcontent ident="oxstdfooter" object="oCont"}]
            <p>[{$oCont->oxcontents__oxcontent->value}]</p>
        [{/oxifcontent}]
    </div>
[{/block}]
[{* TODO: Implement this
[{if $oView->isRootCatChanged()}]
    [{oxscript include="js/widgets/oxmodalpopup.js" priority=10 }]
    [{oxscript add="$( '#scRootCatChanged' ).oxModalPopup({ target: '#scRootCatChanged', openDialog: true});"}]
    <div id="scRootCatChanged" class="popupBox corners FXgradGreyLight glowShadow">
        [{include file="form/privatesales/basketexcl.tpl"}]
    </div>
[{/if}]
*}]