{***************************************************************************
* You can find the license in the docs directory
*
*  Main template for "navigation frame" of all pages
***************************************************************************}
{* OCSTYLE *}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>
        {if ($opt.template.title=="")}
            {$opt.page.subtitle1|escape} {$opt.page.subtitle2|escape}
        {else}
            {$opt.template.title|escape} - {$opt.page.subtitle1|escape} {$opt.page.subtitle2|escape}
        {/if}
    </title>
    <meta name="keywords" content="{$opt.page.meta.keywords|escape}"/>
    <meta name="description" content="{$opt.page.meta.description|escape}"/>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="Content-Style-Type" content="text/css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <meta http-equiv="Content-Language" content="{$opt.template.locale}"/>
    <meta http-equiv="gallerimg" content="no"/>
    <meta http-equiv="cache-control" content="no-cache"/>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge"/>

    <base href="/"/>

    <link rel="SHORTCUT ICON" href="favicon.ico"/>
    <link rel="apple-touch-icon" href="resource2/{$opt.template.style}/images/oclogo/apple-touch-icon-iphone.png"/>
    <link rel="apple-touch-icon" sizes="72x72"
          href="resource2/{$opt.template.style}/images/oclogo/apple-touch-icon-ipad.png"/>
    <link rel="apple-touch-icon" sizes="114x114"
          href="resource2/{$opt.template.style}/images/oclogo/apple-touch-icon-iphone-retina.png"/>
    <link rel="apple-touch-icon" sizes="144x144"
          href="resource2/{$opt.template.style}/images/oclogo/apple-touch-icon-ipad-retina.png"/>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" type="text/css" media="screen" href="web/assets/css/style.min.css">

    <script type="text/javascript" src="resource2/{$opt.template.style}/js/enlargeit/enlargeit.js"></script>
    <script type="text/javascript" src="resource2/{$opt.template.style}/js/tools.js"></script>
    {if $opt.session.url==true}
        <script type="text/javascript">
            {literal}
            <!--
            var sSessionId = '{/literal}{$opt.session.id|escape:'js'}{literal}';
            //-->
            {/literal}
        </script>
        <script src="resource2/{$opt.template.style}/js/session.js" type="text/javascript"></script>
    {/if}
    {foreach from=$opt.page.header_javascript item=scriptItem}
        <script type="text/javascript" src="{$scriptItem}"></script>
    {/foreach}
</head>

{* JS onload() onunload() *}
<body{if $opt.session.url==true} onload="initSessionTimeout()"{/if}
        {foreach from=$opt.page.body_load item=loadItem name=bodyload}{if $smarty.foreach.bodyload.first} onload="{/if}{$loadItem};{if $smarty.foreach.bodyload.last}"{/if}{/foreach}
        {foreach from=$opt.page.body_unload item=unloadItem name=bodyunload}{if $smarty.foreach.bodyunload.first} onunload="{/if}{$unloadItem};{if $smarty.foreach.bodyunload.last}"{/if}{/foreach}
        >


{include file="header/cookie_notice.tpl"}

<header class="header">
    <nav class="navbar">
        <div class="row">
            {if $opt.session.url==true}
                <div id="sessionWarn">
                    {* message is not properly formated and displays always 0
                   don't enable this feature until this is fixed and tested *}
                    Automatische Abmeldung in
                    <div id="sessionTimout">0</div>&nbsp;Minuten -
                    <a href="#" onclick="cancelSessionTimeout()">Abbrechen</a>
                </div>
            {/if}

            {nocache}
                &nbsp;
                {if $login.userid==0}
                    <b>
                        <form action="{$opt.page.login_url}" method="post"
                              enctype="application/x-www-form-urlencoded" name="login" dir="ltr"
                              style="display: inline;">{t}User:{/t}&nbsp;&nbsp;<input name="email" size="10"
                                                                                      type="text"
                                                                                      class="textboxes"
                                                                                      value=""/>&nbsp;&nbsp;&nbsp;{t}Password:{/t}
                                                                   &nbsp;&nbsp;<input name="password" size="10"
                                                                                      type="password"
                                                                                      class="textboxes"
                                                                                      value=""/>&nbsp;<input
                                    type="hidden" name="action" value="login"/><input type="hidden"
                                                                                      name="target"
                                                                                      value="{$opt.page.target|escape}"/><input
                                    type="hidden" name="source" value="titlebar"/>&nbsp;<input name="LogMeIn"
                                                                                               value="{t}Login{/t}"
                                                                                               class="formbutton"
                                                                                               type="submit"
                                                                                               onclick="submitbutton('LogMeIn')"/>
                        </form>
                    </b>
                {else}
                    <b>{t}Logged in as{/t}
                        <a href="myhome.php"
                        >{$login.username|escape}</a>
                    </b>
                    -
                    <a href="login.php?action=logout">{t}Logout{/t}</a>
                {/if}
            {/nocache}
        </div>
    </nav>
</header>

<section class="main__topstage main__home">
    <div class="container-fluid">
        <div class="row content">
            <div class="col-6 col-sm-5">
                <h1 class="title">
                    <img src="resource2/{$opt.template.style}/images/oclogo/{$opt.page.headoverlay}.png">
                </h1>
                <p class="lead">
                    Der Weg das Ziel
                </p>
            </div>
        </div>
    </div>
</section>

<div class="container-fluid">

    <div class="row">

        {* <!-- Navigation Level 2 --> *}
        <div class="nav2">
            <ul>
                {nocache}
                    {include file="sys_topmenu.tpl" items="$topmenu"}
                {/nocache}
            </ul>
        </div> <!-- nav 2 -->


        {* <!-- NAVIGATION --> *}
        {* <!-- Navigation Level 3 --> *}
        <div class="nav3">
            <ul>
                <li class="title">
                    {if $submenu.0.parent==1}{* start page hack *}{t}News{/t}{else}{t}Main menu{/t}{/if}
                </li>
                {nocache}
                    {include file="sys_submenu.tpl" items="$submenu"}
                {/nocache}
            </ul>
        </div> <!-- nav3 -->

        {* <!-- CONTENT --> *}
        <div class="container-fluid">

            <div class="col-3">
                {if $opt.template.popup!=false && $opt.template.popupmargin!=false}
                    <div class="row">
                        {include file="$template.tpl"}
                    </div>
                {else}
                    {include file="$template.tpl"}
                {/if}
            </div> <!-- ocmain -->

        </div> <!-- content2 -->

        {* <!-- End Text Container --> *}

        {* <!-- FOOTER --> *}
        <div class="footer">
            {include file="sys_footer.tpl"}
        </div>

    </div> <!-- page-container-1 -->
</div>


{literal}
<script type="text/javascript">
    // Set to the same value as the web property used on the site
    var gaProperty = '{/literal}{$opt.tracking.googleAnalytics}{literal}';

    // Disable tracking if the opt-out cookie exists.
    var disableStr = 'ga-disable-' + gaProperty;
    if (document.cookie.indexOf(disableStr + '=true') > -1) {
        window[disableStr] = true;
    }

    // Opt-out function
    function gaOptout() {
        document.cookie = disableStr + '=true; expires=Thu, 31 Dec 2099 23:59:59 UTC; path=/';
        window[disableStr] = true;
        if (document.cookie.indexOf(disableStr + '=true') > -1) {
            alert('Google Analytics is now deactivated!');
        }
    }
</script>
{/literal}

{if !$smarty.server.HTTP_DNT}
{literal}
    <script type="text/javascript">
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r;
            i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date();
            a = s.createElement(o),
                    m = s.getElementsByTagName(o)[0];
            a.async = 1;
            a.src = g;
            m.parentNode.insertBefore(a, m)
        })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

        ga('create', gaProperty, 'auto');
        ga('set', 'anonymizeIp', true);
        ga('send', 'pageview');
    </script>
{/literal}
{/if}

</body>
</html>
