{nocache}
    {if $login.userid==0}
        <div class="d-flex align-items-center justify-content-between">
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

                <div class="d-flex align-items-center">
                    <div class="mr-2">
                        <label class="sr-only" for="inlineFormInputGroup">Username</label>
                        <div class="input-group">
                            <div class="bg-dark">
                                <i class="mdi mdi-2x mdi-account-circle"></i>
                            </div>
                            <input
                                    name="email"
                                    placeholder="{t}User{/t}"
                                    type="text"
                                    class="form-control form-control-sm"
                            />
                        </div>
                    </div>
                </div>
                <div class="mr-2">
                    <label class="sr-only" for="inlineFormInputGroup">Password</label>
                    <input name="password"
                           placeholder="{t}Password{/t}"
                           type="password"
                           class="form-control form-control-sm"
                           value=""/>
                </div>

                <div class="">
                    <button name="LogMeIn"
                            class="btn btn-md btn-primary"
                            type="submit"
                            onclick="submitbutton('LogMeIn')"/>
                    <i class="mdi mdi-done"></i>
                    </button>
                </div>

            </form>
        </div>
    {/if}
{/nocache}
