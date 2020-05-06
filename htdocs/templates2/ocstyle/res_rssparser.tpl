{***************************************************************************
* You can find the license in the docs directory
***************************************************************************}
<table class="table table-sm table-hover table-striped">

    {foreach name=rss from=$rss item=rss}
        <tr>
            <td>{$rss.pubDate|date_format:"%d.%m."}</td>
            <td>
                <a href="{$rss.link}" rel="nofollow" target="_blank">{$rss.title}</a>
            </td>
            <td>
                <a href="{$rss.link}" target="_blank" rel="nofollow">{t}more{/t}...</a>
            </td>
        </tr>
    {/foreach}

</table>
