{***************************************************************************
 * You can find the license in the docs directory
 ***************************************************************************}
{* OCSTYLE *}

<div class="row">
    <div class="container-fluid">
        <footer class="main__footer">
            <div class="row">
                <div class="col-4">
                    <h4>{t}Country sites{/t}</h4>
                    <a href="http://www.opencaching.cz" target="_blank" rel="nofollow">
                        <img src="resource2/{$opt.template.style}/images/nodes/oc-cz.png"></a>
                    <a href="http://www.opencaching.nl" target="_blank" rel="nofollow">
                        <img src="resource2/{$opt.template.style}/images/nodes/oc-nl.png"></a>
                    <a href="https://opencaching.pl" target="_blank" rel="nofollow">
                        <img src="resource2/{$opt.template.style}/images/nodes/oc-pl.png"></a>
                    <a href="http://www.opencaching.ro" target="_blank" rel="nofollow">
                        <img src="resource2/{$opt.template.style}/images/nodes/oc-ro.png"></a>
                    <a href="https://opencache.uk" target="_blank" rel="nofollow">
                        <img src="resource2/{$opt.template.style}/images/nodes/oc-org-uk.png"></a>
                    <a href="http://www.opencaching.us" target="_blank" rel="nofollow">
                        <img src="resource2/{$opt.template.style}/images/nodes/oc-us.png"></a>
                </div>

                <div class="col-4">
                    <h4>{t}Datalicense{/t}</h4>
                    <p class="justify-content-center">{$license_disclaimer}</p>
                    <p>
                        <small>
                            {nocache}
                                {t}Page timing:{/t} {$sys_runtime|sprintf:"%1.3f"} {t}sec{/t}
                                <br/>
                                {if ($opt.template.caching == true)}
                                    {t}Page cached:{/t} {if $sys_cached==true}{t}Yes{/t}{else}{t}No{/t}{/if}
                                    <br/>
                                {/if}

                            {/nocache}
                            {t}Created at:{/t} {"0"|date_format:$opt.format.datetime}
                        </small>
                    </p>
                </div>

                <div class="col-4">
                    <h4>{t}Follow us:{/t}</h4>
                    <a href="http://blog.opencaching.de/feed">
                        <img src="resource2/{$opt.template.style}/images/media/16x16-feed.png"></a>
                    <a href="https://twitter.com/opencaching">
                        <img src="resource2/{$opt.template.style}/images/media/16x16-twitter.png"></a>
                    <a href="https://www.facebook.com/opencaching.de">
                        <img src="resource2/{$opt.template.style}/images/media/16x16-facebook.png"></a>

                    <h4>{t}Join discussions:{/t}</h4>
                    <a href="http://forum.opencaching.de/">
                        <img src="resource2/{$opt.template.style}/images/oclogo/16x16-oc_logo.png"/>
                        {t}Opencaching Forum{/t}
                    </a>
                    <br>
                    <a href="https://www.facebook.com/groups/198752500146032/">
                        <img src="resource2/{$opt.template.style}/images/media/16x16-facebook.png"/>
                        {t}Facebook Group{/t}
                    </a>
                    <br>
                    <a href="https://github.com/OpencachingDeutschland/oc-server3">
                        <img src="resource2/{$opt.template.style}/images/media/16x16-github.png"/>
                        GitHub
                    </a>
                </div>
            </div>
        </footer>
    </div>
</div>
