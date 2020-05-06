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

    <!-- Legacy CSS -->
    <link rel="stylesheet" type="text/css" media="screen,projection"
          href="resource2/{$opt.template.style}/css/style_screen.css?ft={$screen_css_time}"/>
    <!--[if lt IE 9]>
        <link rel="stylesheet" type="text/css" media="screen,projection" href="resource2/{$opt.template.style}/css/style_screen_msie.css?ft={$screen_msie_css_time}" />
        <![endif]-->
    <link rel="stylesheet" type="text/css" media="print"
          href="resource2/{$opt.template.style}/css/style_print.css?ft={$print_css_time}"/>

    {literal}
    <script type="text/javascript">
        <!--
        var nWindowWidth = 9999;
        if (window.innerWidth)
            nWindowWidth = window.innerWidth;
        else if (screen.availWidth)
            nWindowWidth = screen.availWidth;

        function usercountry_change() {
            var sCurrentOption = "{/literal}{$opt.template.country|escapejs}{literal}";
            var oUserCountryCombo = document.getElementById('usercountry');

            if (sCurrentOption != oUserCountryCombo.value) {
                document.getElementById('language_switcher').submit();
            }
        }

        function submitbutton(bname) {
            document.getElementsByName(bname)[0].className = "formbutton_active";
        }

        function resetbutton(bname) {
            document.getElementsByName(bname)[0].className = "formbutton"
        }

        function flashbutton(bname) {
            document.getElementsByName(bname)[0].className = "formbutton_active";
            window.setTimeout('resetbutton(\'' + bname + '\')', 350);
        }

        var img1 = new Image();
        img1.src = "resource2/ocstyle/images/page/nav2-bg.png";
        var img2 = new Image();
        img2.src = "resource2/ocstyle/images/page/nav2-sel-bg.png";
        var img3 = new Image();
        img3.src = "resource2/ocstyle/images/page/nav3-title-bg.png";
        var img4 = new Image();
        img4.src = "resource2/ocstyle/images/page/section-bg.png";
        var img5 = new Image();
        img5.src = "resource2/ocstyle/images/page/listheader-bg.png";
        //-->
    </script>
    {/literal}
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
        class="{if $opt.template.popup!=false}popup{/if}">
{include file="header/cookie_notice.tpl"}
{if $opt.template.popup!=true}
<div id="overall">
    <div id="langstripe">

        {* <!-- Navigation Level 1 --> *}
        <table class="nav1" cellspacing="0">
            <tr>
                {if $opt.session.url==true}
                    <div id="sessionWarn">
                        {* message is not properly formated and displays always 0
                       don't enable this feature until this is fixed and tested *}
                        Automatische Abmeldung in
                        <div id="sessionTimout">0</div>&nbsp;Minuten -
                        <a href="#" onclick="cancelSessionTimeout()">Abbrechen</a>
                    </div>
                {/if}
                <td width="100%">
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
                                                                                                       style="width: 74px;"
                                                                                                       type="submit"
                                                                                                       onclick="submitbutton('LogMeIn')"/>
                                </form>
                            </b>
                        {else}  {* Ocprop: <a href="myhome.php">(.*?)<\/a>.*?<a href="login.php
                                                   <a href="myhome.php">.*?<a href="login.php\?action=logout"> *}
                            <b>{t}Logged in as{/t}
                                <a href="myhome.php"
                                   class="testing-top-left-corner-username">{$login.username|escape}</a>
                            </b>
                            -
                            <a href="login.php?action=logout">{t}Logout{/t}</a>
                        {/if}
                    {/nocache}
                </td>
                <td><strong>{t}Language:{/t}&nbsp;</strong></td>
                <td>
                    {foreach from=$opt.template.locales key=localeKey item=localeItem}
                        {if $localeItem.status == OC_LOCALE_ACTIVE}
                            <a style="text-decoration: none;" href="{$base_pageadr}locale={$localeKey}"><img
                                        src="{$localeItem.flag}" alt="{$localeItem.name|escape}"
                                        title="{$localeItem.name|escape}" width="24px" height="18px"/></a>
                        {/if}
                    {/foreach}
                </td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;<strong>{t}Country:{/t}&nbsp;</strong></td>
                <td>
                    <form action="index.php" method="get" id="language_switcher">
                        <select id="usercountry" name="usercountry" onchange="usercountry_change();">
                            {foreach from=$opt.template.usercountrieslist item=countryItem name=userCountryList}
                                {if $countryItem.begin_group==1 || $smarty.foreach.userCountryList.first}
                                    <option disabled="disabled">
                                        {if $countryItem.group==1}
                                            - {t}This OC node{/t} -
                                        {elseif $countryItem.group==2}
                                            - {t}Other OC nodes{/t} -
                                        {elseif $countryItem.group==3}
                                            - {t}Others{/t} -
                                        {else}
                                            -
                                        {/if}
                                    </option>
                                {/if}
                                <option value="{$countryItem.country|escape}"{if $opt.template.country==$countryItem.country} selected="selected"{/if}>{$countryItem.name|escape}</option>
                            {/foreach}
                        </select>&nbsp;
                    </form>
                </td>
            </tr>
        </table>
    </div> <!-- langstripe -->
    <div class="page-container-1" style="position: relative;">

        <div id="bg1">&nbsp;</div>
        <div id="bg2">&nbsp;</div>

        {* <!-- HEADER --> *}
        {* <!-- Debugschalter hier wieder einsetzen --> *}
        {if ($opt.debug & DEBUG_DEVELOPER) == DEBUG_DEVELOPER}
            <div id="debugoc"><font size="5" face="arial" color="red">
                    <center>{t}Developer system - only testing{/t}</center>
                </font></div>
        {elseif ($opt.debug & DEBUG_TESTING) == DEBUG_TESTING}
            <div id="debugoc"><font size="5" face="arial" color="red">
                    <center>{t}Testing - do not login, please{/t}</center>
                </font></div>
        {/if}


        {* <!-- Header banner --> *}
        <div class="header">
            <div class="headerimage">
                <img src="resource2/{$opt.template.style}/images/head/rotator.php?path={$opt.page.headimagepath}"
                     class="headerimagecontent"/>
            </div>
            <div class="headerlogo">
                <img src="resource2/{$opt.template.style}/images/oclogo/{$opt.page.headoverlay}.png"
                     class="headerimagecontent"/>
            </div>
        </div> <!-- header -->

        {* <!-- Navigation Level 2 --> *}
        <div class="nav2">
            <ul>
                {nocache}
                    {include file="sys_topmenu.tpl" items="$topmenu"}
                {/nocache}
            </ul>
        </div> <!-- nav 2 -->

        {* <!-- Breadcrumb Navigation and Search box --> *}
        <div class="buffer" style="height: 30px; width:100%;">
            {if $opt.page.nowpsearch}
                <div id="breadcrumb_fullsize">{include file="sys_breadcrumb.tpl" items="$breadcrumb"}</div>
            {else}
                <div id="breadcrumb">{include file="sys_breadcrumb.tpl" items="$breadcrumb"}</div>
                <div id="suchbox">
                    <form action="searchplugin.php" method="post"><b>{t}Waypoint-Search:{/t}</b>&nbsp;<input
                                type="hidden" name="sourceid" value="waypoint-search"/> <input type="text"
                                                                                               name="userinput"
                                                                                               size="10"
                                                                                               class="waypoint"/> <input
                                type="submit" name="wpsearch" class="formbutton" style="width:auto"
                                value="&nbsp;{t}Go{/t}&nbsp;" onclick="submitbutton('wpsearch')"/></form>
                </div>
            {/if}
        </div>

        {if $helplink != ""}
            <div class="tplhelp">{$helplink}<img src="resource2/ocstyle/images/misc/32x32-help.png"/></a></div>
            <!--[if IE]>
            <div></div><![endif]-->
        {/if}

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
        <div class="content2">
            {/if}{* Popup *}

            <div id="ocmain">
                {if $opt.template.popup!=false && $opt.template.popupmargin!=false}
                    <div style="padding-left: 25px; padding-top: 10px; padding-right: 10px; padding-bottom: 20px; margin: 0; background: white;">
                        {include file="$template.tpl"}
                    </div>
                {else}
                    {include file="$template.tpl"}
                {/if}
            </div> <!-- ocmain -->

            {if $opt.template.popup!=true}
        </div> <!-- content2 -->

        {* <!-- End Text Container --> *}

        {* <!-- FOOTER --> *}
        <div class="footer">
            {include file="sys_footer.tpl"}
        </div>

    </div> <!-- page-container-1 -->
</div> <!-- overall -->
{/if}{*popup*}

{if $opt.tracking.googleAnalytics}
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
{/if}

</body>
</html>
