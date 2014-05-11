<li [{if $oxcmp_user->oxuser__oxpassword->value}]class="dropdown"[{/if}]>
    [{include file="widget/header/loginbox.tpl"}]
</li>
[{if !$oxcmp_user}]
    <li><a href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=register"}]" title="[{oxmultilang ident="REGISTER"}]">[{oxmultilang ident="REGISTER"}]</a></li>
[{/if}]
[{include file="widget/header/servicebox.tpl"}]
[{oxscript widget=$oView->getClassName()}]