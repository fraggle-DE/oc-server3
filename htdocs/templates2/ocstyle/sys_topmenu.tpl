{***************************************************************************
 * You can find the license in the docs directory
 ***************************************************************************}
{* OCSTYLE *}
{strip}
    {foreach name=topmenu from=$items item=menuitem}

        <li class="nav-item">
            <a class="nav-link"
               href="{$menuitem.href}"
                    {$menuitem.target}
                    {if $menuitem.selected} class="active"{/if}>{$menuitem.menustring|escape}</a>
        </li>

    {/foreach}
{/strip}
