<form action="[{$oViewConf->getSslSelfLink()}]" method="post" class="form-inline">
    [{$oViewConf->getHiddenSid()}]
    <input type="hidden" name="fnc" value="fill">
    <input type="hidden" name="cl" value="newsletter">
    [{if $oView->getProduct()}]
        [{assign var="product" value=$oView->getProduct()}]
        <input type="hidden" name="anid" value="[{$product->oxarticles__oxnid->value}]">
    [{/if}]
    <div class="form-group">
        <label for="newsletterSubscribeInput">[{oxmultilang ident="NEWSLETTER" suffix="COLON"}]</label>
        <input id="newsletterSubscribeInput" class="form-control" type="email" name="editval[oxuser__oxusername]" placeholder="[{oxmultilang ident="EMAIL_ADDRESS"}]">
    </div>
    <button class="btn btn-default" type="submit">[{oxmultilang ident="SUBSCRIBE"}]</button>
</form>