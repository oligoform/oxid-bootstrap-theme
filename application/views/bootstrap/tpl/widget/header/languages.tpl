[{if $oView->isLanguageLoaded()}]
    [{capture name="languageList"}]
        [{foreach from=$oxcmp_lang item=_lng}]
            [{if $_lng->selected}]
                [{capture name="languageSelected"}]
                    <a class="dropdown-toggle" data-toggle="dropdown" title="[{$_lng->name}]" href="[{$_lng->link|oxaddparams:$oView->getDynUrlParams()}]" hreflang="[{$_lng->abbr}]">[{$_lng->name}]</a>
                [{/capture}]
            [{/if}]
            <li[{if $_lng->selected}] class="active"[{/if}]><a title="[{$_lng->name}]" href="[{$_lng->link|oxaddparams:$oView->getDynUrlParams()}]" hreflang="[{$_lng->abbr}]">[{$_lng->name}]</a></li>
        [{/foreach}]
    [{/capture}]
    <li class="dropdown">
        [{$smarty.capture.languageSelected}]
        <ul class="dropdown-menu" role="menu">
            [{$smarty.capture.languageList}]
        </ul>
    </li>
[{/if}]
[{oxscript widget=$oView->getClassName()}]