{nocache}
    {if $login.userid==0}
        <!-- Button trigger modal -->
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalOcLogin">
            Login
        </button>
        <!-- Modal -->
        <div class="modal  fade" id="modalOcLogin" data-backdrop="static" data-keyboard="false" tabindex="-1"
             role="dialog" aria-labelledby="modalOcLoginLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalOcLoginLabel">Login into Opencaching</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container">
                            <div class="row">
                                <form
                                        action="{$opt.page.login_url}"
                                        method="post"
                                        enctype="application/x-www-form-urlencoded"
                                        name="login"
                                        dir="ltr"
                                        class="form-inline"
                                >
                                    <input type="hidden" name="action" value="login"/>
                                    <input type="hidden" name="target" value="{$opt.page.target|escape}"/>
                                    <input type="hidden" name="source" value="titlebar"/>

                                    <div class="col-xs-12 col-md-6">
                                        <div class="form-group">
                                            <label for="LoginInput">Login</label>
                                            <input
                                                    name="email"
                                                    placeholder="{t}User{/t}"
                                                    type="text"
                                                    class="form-control form-control-sm"
                                                    id="LoginInput"
                                            />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-md-6">
                                        <div class="form-group">
                                            <label for="PasswordInput">Password</label>
                                            <input name="password"
                                                   placeholder="{t}Password{/t}"
                                                   type="password"
                                                   class="form-control form-control-sm"
                                                   id="PasswordInput"
                                                   value=""/>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-md-12">
                                        <button name="LogMeIn"
                                                class="btn btn-xs btn-outline-primary btn-block"
                                                type="submit"
                                                onclick="submitbutton('LogMeIn')"/>
                                        <i class="mdi mdi-exit-to-app"></i> Login
                                        </button>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Register</button>
                    </div>
                </div>
            </div>
        </div>
    {/if}
{/nocache}
