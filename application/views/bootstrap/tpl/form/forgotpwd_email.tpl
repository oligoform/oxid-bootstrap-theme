<p>[{ oxmultilang ident="HAVE_YOU_FORGOTTEN_PASSWORD" }]</p>
<p>[{ oxmultilang ident="HERE_YOU_SET_UP_NEW_PASSWORD" }]</p>

<form action="[{$oViewConf->getSelfActionLink()}]" name="forgotpwd" method="post" class="form-horizontal" role="form">
    [{$oViewConf->getHiddenSid()}]
    [{$oViewConf->getNavFormParams()}]
    <input type="hidden" name="fnc" value="forgotpassword">
    <input type="hidden" name="cl" value="forgotpwd">
    <input type="hidden" name="actcontrol" value="forgotpwd">

    <div class="form-group">
        <label for="forgotPasswordUserLoginName[{$idPrefix}]" class="col-sm-3 control-label">[{oxmultilang ident="YOUR_EMAIL_ADDRESS" suffix="COLON"}]</label>
        <div class="col-sm-9">
            <input id="forgotPasswordUserLoginName[{$idPrefix}]" type="email" name="lgn_usr" value="[{$oView->getActiveUsername()}]" class="form-control" required>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-3 col-sm-9">
            <button type="submit" class="btn btn-default">[{oxmultilang ident="REQUEST_PASSWORD"}]</button>
        </div>
    </div>
</form>

<p>[{oxmultilang ident="REQUEST_PASSWORD_AFTERCLICK"}]</p>

[{oxifcontent ident="oxforgotpwd" object="oCont"}]
    [{$oCont->oxcontents__oxcontent->value}]
[{/oxifcontent}]