[{assign var="bIsError" value=0}]
[{capture name=loginErrors}]
    [{foreach from=$Errors.loginBoxErrors item=oEr key=key}]
        <div class="alert alert-danger alert-dismissable">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            [{$oEr->getOxMessage()}]
        </div>
        [{assign var="bIsError" value=1 }]
    [{/foreach}]
[{/capture}]
[{if !$oxcmp_user->oxuser__oxpassword->value}]

    <!-- Forgot Password Modal -->
    <div class="modal fade" id="forgotPasswordModal" tabindex="-1" role="dialog" aria-labelledby="forgotPasswordModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="forgotPasswordModalLabel">[{oxmultilang ident="FORGOT_PASSWORD"}]</h4>
                </div>
                <div class="modal-body">
                    [{include file="form/forgotpwd_email.tpl" idPrefix="Popup"}]
                </div>
            </div>
        </div>
    </div>

    <a href="#" title="[{oxmultilang ident="LOGIN"}]" data-toggle="modal" data-target="#loginModal">
        [{oxmultilang ident="LOGIN"}]
    </a>

    <!-- Login Modal -->
    <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="loginModalLabel">Login</h4>
                </div>

                <form name="login" action="[{$oViewConf->getSslSelfLink()}]" method="post" class="form-horizontal" role="form">
                    [{$oViewConf->getHiddenSid()}]
                    [{$oViewConf->getNavFormParams()}]
                    <input type="hidden" name="fnc" value="login_noredirect">
                    <input type="hidden" name="cl" value="[{$oViewConf->getTopActiveClassName()}]">
                    [{if $oViewConf->getTopActiveClassName() eq "content"}]
                        <input type="hidden" name="oxcid" value="[{$oViewConf->getContentId()}]">
                    [{/if}]
                    <input type="hidden" name="pgNr" value="[{$oView->getActPage()}]">
                    <input type="hidden" name="CustomError" value="loginBoxErrors">
                    [{if $oViewConf->getActArticleId()}]
                        <input type="hidden" name="anid" value="[{$oViewConf->getActArticleId()}]">
                    [{/if}]

                    <div class="modal-body">
                        [{if $bIsError}]
                            <div class="form-group">
                                [{$smarty.capture.loginErrors}]
                            </div>
                        [{/if}]
                        <div class="form-group">
                            <label for="loginEmail" class="col-sm-3 control-label">[{oxmultilang ident="EMAIL_ADDRESS"}]</label>
                            <div class="col-sm-9">
                                <input type="email" id="loginEmail" class="form-control" name="lgn_usr" placeholder="[{oxmultilang ident="EMAIL_ADDRESS"}]">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="loginPasword" class="col-sm-3 control-label">[{oxmultilang ident="PASSWORD"}]</label>
                            <div class="col-sm-9">
                                <div class="input-group">
                                    <input type="password" id="loginPasword" class="form-control" name="lgn_pwd" placeholder="[{oxmultilang ident="PASSWORD"}]">
                                    <span class="input-group-btn">
                                        <button class="btn btn-default" type="button" data-dismiss="modal" data-toggle="modal" data-target="#forgotPasswordModal">
                                            <span class="glyphicon glyphicon-question-sign"></span>
                                        </button>
                                    </span>
                                </div>
                            </div>
                        </div>
                        [{if $oViewConf->isFunctionalityEnabled( "blShowRememberMe" )}]
                            <div class="form-group">
                                <div class="col-sm-offset-3 col-sm-9">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" value="1" name="lgn_cook"> [{oxmultilang ident="REMEMBER_ME"}]
                                        </label>
                                    </div>
                                </div>
                            </div>
                        [{/if}]
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">[{oxmultilang ident="CLOSE"}]</button>
                        <button type="submit" class="btn btn-primary">[{oxmultilang ident="LOGIN"}]</button>
                    </div>
                </form>

                [{*if $oViewConf->getShowFbConnect()}]
                    <div class="altLoginBox corners clear">
                        <span>[{ oxmultilang ident="LOGIN_WITH" suffix="COLON" }]</span>
                        <div id="loginboxFbConnect">
                            [{include file="widget/facebook/enable.tpl" source="widget/facebook/connect.tpl" ident="#loginboxFbConnect" }]
                        </div>
                    </div>
                [{/if*}]

            </div>
        </div>
    </div>

[{else}]
    <a class="dropdown-toggle" data-toggle="dropdown" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account"}]">
        [{oxmultilang ident="GREETING"}]
        [{assign var="fullname" value=$oxcmp_user->oxuser__oxfname->value|cat:" "|cat:$oxcmp_user->oxuser__oxlname->value}]
        [{if $fullname}]
            [{$fullname}]
        [{else}]
            [{$oxcmp_user->oxuser__oxusername->value|oxtruncate:25:"...":true}]
        [{/if}]
        <span class="caret"></span>
        <ul class="dropdown-menu">
            <li><a href="[{$oViewConf->getLogoutLink()}]" title="[{oxmultilang ident="LOGOUT"}]">[{oxmultilang ident="LOGOUT"}]</a></li>
        </ul>
    </a>
[{/if}]
