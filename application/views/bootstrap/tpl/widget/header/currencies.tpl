[{if $oView->loadCurrency()}]
    [{capture name="currencyList"}]
        [{foreach from=$oxcmp_cur item=_cur}]
            [{if $_cur->selected}]
                [{assign var="selectedCurrency" value=$_cur->name}]
                [{capture name="currencySelected"}]
                    <a class="dropdown-toggle" data-toggle="dropdown" href="[{$_cur->link|oxaddparams:$oView->getDynUrlParams()}]" title="[{ $_cur->name }]" rel="nofollow">[{ $_cur->name }]</a>
                [{/capture}]
            [{/if}]
            <li[{if $_cur->selected}] class="active"[{/if}]><a href="[{$_cur->link|oxaddparams:$oView->getDynUrlParams()}]" title="[{$_cur->name}]" rel="nofollow">[{$_cur->name}]</a></li>
        [{/foreach}]
    [{/capture}]
    <li class="dropdown">
        [{$smarty.capture.currencySelected}]
        <ul class="dropdown-menu">
            [{$smarty.capture.currencyList}]
        </ul>
    </li>
[{/if}]
[{oxscript widget=$oView->getClassName()}]