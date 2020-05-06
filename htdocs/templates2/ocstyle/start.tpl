{***************************************************************************
* You can find the license in the docs directory
***************************************************************************}

<div class="container-fluid ">
    <img class="img-fluid" src="images/static/OC_Titelbild_2.jpg">
</div>

{if $core_hq_message.message !=""}
    <div class="container-fluid ">
        <div class="flash-messages__alert">
            {$core_hq_message.message}
        </div>
    </div>
{/if}

{* Blognews *}
<div class="container-fluid">
    <div class="row oc-title">
        <div class="col-1">
            <img src="resource2/{$opt.template.style}/images/misc/32x32-news.png">
        </div>
        <div class="col-9 oc-title__title">
            {t}Blog-News{/t}
        </div>
        <div class="col-2 oc-title__link">
            {if $total_events > $events|@count}
                [
                <a href="https://blog.opencaching.de/" rel="nofollow" target="_blank">{t}more{/t}...</a>
                ]
            {/if}
        </div>
    </div>

    <div class="row">
        {if $news|@count}
            {include file="res_rssparser.tpl" rss=$news}
        {else}
            <p><em>{t}currently not available{/t}</em></p>
        {/if}
    </div>
</div>

{* Events *}
<div class="container-fluid">
    <div class="row oc-title">
        <div class="col-1">
            <img src="resource2/{$opt.template.style}/images/cacheicon/event.gif">
        </div>
        <div class="col-9 oc-title__title">
            {t 1=$usercountry|escape}The next events in %1{/t}
        </div>
        <div class="col-2 oc-title__link">
            {if $total_events > $events|@count}
                [
                <a href="newcaches.php?cachetype=6">{t}more{/t}...</a>
                ]
            {/if}
        </div>
    </div>

    <div class="row">
        {include file="res_newevents.tpl" events=$events}
    </div>
</div>

{* Logpictures *}
<div class="container-fluid">
    <div class="row oc-title">
        <div class="col-1">
            <img src="resource2/{$opt.template.style}/images/misc/32x32-pictures.gif">
        </div>
        <div class="col-9 oc-title__title">
            <a href="newlogpics.php">
                {t}New log pictures{/t}
            </a>
        </div>
        <div class="col-2 oc-title__link">
            [
            <a href="newlogpics.php">{t}more{/t}...</a>
            ]
        </div>
    </div>

    <div class="row">
        {include file="res_logpictures.tpl" logdate=true loguser=true}
    </div>
</div>

{* recommendations *}
<div class="container-fluid">
    <div class="row oc-title">
        <div class="col-1">
            <img src="resource2/{$opt.template.style}/images/misc/32x32-winner.png">
        </div>
        <div class="col-9 oc-title__title">
            <a href="tops.php">
                {t}Current top ratings{/t}
            </a>
        </div>
        <div class="col-2 oc-title__link">
            [
            <a href="tops.php">{t}more{/t}...</a>
            ]
        </div>
    </div>

    <div class="row">
        {include file="res_newratings.tpl" topratings=$topratings}
    </div>
</div>

{* forum news *}
<div class="container-fluid">
    <div class="row oc-title">
        <div class="col-1">
            <img src="resource2/ocstyle/images/misc/32x32-news.png">
        </div>
        <div class="col-11 oc-title__title">
            <a href="{$forum_link|escape}" rel="nofollow" target="_blank">
                {t 1=$forum_name|escape}Community news{/t}
            </a>
        </div>
    </div>

    <div class="row">
        {if $forum|@count}
            {include file="res_rssparser.tpl" rss=$forum}
        {else}
            <p><em>{t}currently not available{/t}</em></p>
        {/if}
    </div>
</div>

{* new caches *}
<div class="container-fluid">
    <div class="row oc-title">
        <div class="col-1">
            <img src="resource2/{$opt.template.style}/images/cacheicon/traditional.gif">
        </div>
        <div class="col-9 oc-title__title">
            <a href="newcaches.php?country={$usercountryCode}">
                {t 1=$usercountry|escape}Newest caches in %1{/t}
            </a>
        </div>
        <div class="col-2 oc-title__link">
            [
            <a href="newcaches.php">{t}more{/t}...</a>
            ]
        </div>
    </div>
    <div class="row">
        {include file="res_newcaches.tpl" newcaches=$newcaches}
    </div>
    <div class="row float-right">
        ({t 1=$count_hiddens 2=$count_founds 3=$count_users}Total of %1 active Caches and %2 founds by %3 users{/t}
        )
    </div>
</div>
