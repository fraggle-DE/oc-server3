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
    <link rel="stylesheet" href="vendor/mervick/material-design-icons/css/material-icons.min.css">

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

<header>
    <nav class="main__header navbar fixed-top">
        <div class="container-fluid">
            <div class="col-auto">
                <a href="/"><i class="mdi mdi-2x mdi-home"></i></a>
            </div>
            <div class="col-auto">

            </div>
            <div class="col-auto">
                {include file="header/login.tpl"}
                {include file="header/user.tpl"}
            </div>
        </div>
    </nav>
</header>

<section class="main__topstage main__home">
    <div class="container-fluid">
        <div class="main__content-box p-3 d-inline-flex">
            <div class="svg-oc--brand"></div>
            <div class="main__content ">
                <div class="main__content-title">Opencachnig.de</div>
                <div class="main__content-tagline">Der Weg das Ziel</div>
            </div>

        </div>
    </div>
</section>

<div class="container-fluid">
    <div class="row">
        <div class="col-3">
            <div>
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
                </div>
            </div><!-- nav3 -->
        </div>


        {* <!-- CONTENT --> *}

        <div class="col-9">
            {if $opt.template.popup!=false && $opt.template.popupmargin!=false}
                <div class="row">
                    {include file="$template.tpl"}
                </div>
            {else}
                {include file="$template.tpl"}
            {/if}
        </div> <!-- ocmain -->
    </div>
</div> <!-- content2 -->


{* <!-- FOOTER --> *}
<div class="container-fluid">
    <div class="row">
        <div class="footer">
            {include file="sys_footer.tpl"}
        </div>
    </div>
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
