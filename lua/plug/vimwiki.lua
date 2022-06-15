vim.g.calendar_frame = "default"
-- vim.g.calendar_google_calendar =  1
vim.g.calendar_google_task =  0
-- let g:calendar_google_api_key = '...'
-- let g:calendar_google_client_id = '....apps.googleusercontent.com'
-- let g:calendar_google_client_secret = '...'

vim.cmd[[
  nmap <Leader>wl <Plug>VimwikiToggleListItem
  vmap <Leader>wl <Plug>VimwikiToggleListItem
  nnoremap gwo :VimwikiChangeSymbolTo a)<CR>

]]

    vim.g.vimwiki_auto_chdir = 1
    vim.g.vimwiki_use_mouse = 1
    vim.g.vimwiki_auto_header = 1
    vim.g.vimwiki_hl_headers = 1
    vim.g.vimwiki_hl_cb_checked = 1
    vim.g.vimwiki_dir_link = "index"
    vim.g.vimwiki_markdown_link_ext = 1
    vim.g.vimwiki_links_header = "Links"
    vim.g.vimwiki_links_header_level = 2
    vim.g.vimwiki_global_ext = 0
    -- vim.g.vimwiki_markdown_link_ext = 1
    vim.g.vimwiki_create_link = 1
    vim.g.vimwiki_tags_header = 'Tags'
    vim.g.vimwiki_tags_header_level = 2
    vim.g.vimwiki_toc_header = "Table of Contents"
    vim.g.vimwiki_toc_header_level = 2
    vim.g.vimwiki_concea_pre = 2
vim.g.vimwiki_cycle_bullets = 1
vim.g.vimwiki_auto_diary_index = 1
vim.g.vimwiki_auto_generate_tags = 1
vim.g.vimwiki_auto_tags=1
vim.g.diary_rel_path="jrnl"
vim.g.vimwiki_ext = '.md'
vim.g.vimwiki_Use_calendar = 1
vim.g.vimwiki_Use_calendar = 1
    vim.g.vimwiki_auto_generate_tags = 1
    vim.g.vimwiki_list_margin = 2
    -- vim.g.vimwiki_folding = 'expr'
    vim.g.vimwiki_listing_hl = 1
    vim.g.vimwiki_hl_cb_checked = 1
    vim.g.vimwiki_generated_links_caption = 1
    vim.g.vimwiki_html_filename_parameterization = 1
    vim.g.vimwiki_html_header_numbering = 1
    vim.g.vimwiki_dir_link = 'index'
    vim.g.vimwiki_list_ignore_newline = 0
    -- vim.g.vimwiki_listsyms = '✗○◐●✓'
    -- vim.g.vimwiki_listsym_rejected = '✗'
    vim.g.vimwiki_listsyms = '✗○◐●✓'
    vim.g.vimwiki_bullet_types = {'•', '•', '→', "◉", "○", "✸", "✿" }
    vim.g.vimwiki_list = {
      {
        name = 'm',
        syntax = 'markdown',
        ext = '.md',
        path_html = "/home/clp/m/.html",
        path = '/home/clp/m',
        cycle_bullcets = true,
        bullet_types = {'•', '→', '-'},
        option_maxhi = 1,
        diary_rel_path = "diary",
        dir_link = "index",
        generated_links_caption = 1,
        create_link = 1,
        recurring_bullets = 1,
        conceal_oncechar_markers = 1,
        conceal_pre = 1,
        automatic_nested_syntaxes = 1,
        diary_caption_level = 1,
        template_path = '~/m/tmpl/',
        template_default = "index",
        diary_header = "Entries",
        auto_toc = 0,
        auto_tags = 1,
        auto_export = 0,
        auto_header = 1,
        auto_generate_links = 1,
        auto_generate_tags = 1,
        auto_diary_index = 1,
        rss_name = "miki.rss",
        css_name = "style.css",
        diary_frequency = "daily",
        diary_index = "index",
        diary_start_week_day = "sunday",
        template_date_format = "%Y-%m-%d",
        rx_todo = 'C<%(TODO|DONE|STARTED|FIXME|FIXED|XXX|NOTE|IMPORTANT)>'
      },
      {
        name = 'mk',
        syntax = 'markdown',
        ext = '.md',
        path_html = "/Users/clp/mk/.html",
        path = '/Users/clp/mk',
        cycle_bullcets = true,
        bullet_types = {'•', '→', '-'},
        option_maxhi = 1,
        diary_rel_path = "diary",
        dir_link = "index",
        generated_links_caption = 1,
        create_link = 1,
        recurring_bullets = 1,
        conceal_oncechar_markers = 1,
        conceal_pre = 1,
        automatic_nested_syntaxes = 1,
        diary_caption_level = 1,
        template_path = '~/mk/tmpl/',
        template_default = "index",
        diary_header = "Entries",
        auto_toc = 0,
        auto_tags = 1,
        auto_export = 0,
        auto_header = 1,
        auto_generate_links = 1,
        auto_generate_tags = 1,
        auto_diary_index = 1,
        rss_name = "miki.rss",
        css_name = "style.css",
        diary_frequency = "daily",
        diary_index = "index",
        diary_start_week_day = "sunday",
        template_date_format = "%Y-%m-%d",
        rx_todo = 'C<%(TODO|DONE|STARTED|FIXME|FIXED|XXX|NOTE|IMPORTANT)>'
      }
    }
-- g = vim.g
-- vim.cmd[[
-- function <SID>ExpandTimestampTemplates()
-- let l:day               = strftime('%a')
-- let l:day_full          = strftime('%A')
-- let l:date              = strftime('%d')
-- let l:month             = strftime('%m')
-- let l:month_short       = strftime('%b')
-- let l:month_full        = strftime('%B')
-- let l:year              = strftime('%Y')
-- let l:today             = strftime('%d/%m/%Y')
-- let l:time              = strftime('%T %Z')
-- let l:time_12           = strftime('%r')
-- let l:timestamp         = strftime('%A %b %d, %Y %T %Z')
-- ]]
-- vim.cmd[[
-- function! vimwikiLinkHandler(link)
-- try
--   let browser = 'C:\Program Files\Firefox\firefox.exe'
--   execute '!start "'.browser.'" ' . a:link
--   return 1
-- catch
--   echo "This can happen for a variety of reasons ..."
-- endtry
-- return 0
-- endfunction
-- ]]
-- --
-- g.vimwiki_use_calendar = 1
-- g.vimwiki_use_mouse = 1
-- g.vimwiki_auto_header = 1
-- g.vimwiki_hl_headers = 1
-- g.vimwiki_hl_cb_checked = 1
-- -- g.vimwiki_listsym_rejected = '✗' -- " ϴ
-- -- g.vimwiki_listsyms = ' ○◐●✓'
-- g.vimwiki_dir_link = "index"
-- g.vimwiki_markdown_link_ext = 1
-- g.vimwiki_links_header = "Links"
-- g.vimwiki_links_header_level = 2
-- g.vimwiki_tags_header = 'Tags'
-- g.vimwiki_tags_header_level = 2
-- g.vimwiki_toc_header = "Table of Contents"
-- g.vimwiki_toc_header_level = 2
-- g.vimwiki_filetypes = { "markdown"} --, "pandoc" }
-- g.vimwiki_list_margin = 2
-- -- g.vimwiki_auto_chdir = 1
-- g.vimwiki_auto_diary_index = 1
-- g.vimwiki_auto_header = 1
-- g.vimwiki_auto_tags = 1
-- g.vimwiki_conceal_oncechar_markers = 1
-- g.vimwiki_conceal_pre = 1
-- g.vimwiki_use_mouse = 1
-- g.vimwiki_template_ext = ".md"
-- g.vimwiki_tags_header = "Gen Tags"
-- g.vimwiki_table_reduce_last_col = 1
-- g.vimwiki_template_path = "/Users/clp/mk/.tmpl"
-- g.vimwiki_symH = 1
-- g.vimwiki_recurring_bullets = 1
-- g.vimwiki_rss_name = "mk.xml"
-- -- g.vimwiki_nested_syntaxes = {}
-- -- g.vimwiki_valid_html_tags={"b","i","s","u","sub","sup","kbd","br","hr"}
-- g.vimwiki_toc_link_format = 1
-- g.vimwiki_name = "miki"
-- g.vimwiki_table_reduce_last_col = 1
-- g.vimwiki_user_htmls = "/Users/clp/mk/.html"
-- g.vimwiki_listsyms = '✗○◐●✓'
-- g.vimwiki_conceal_oncechar_markers = 1
-- g.vimwiki_conceal_pre = 1
-- g.vimwiki_conceallevel = 1
-- g.vimwiki_markdown_link_ext = 1

-- g.vimwiki_create_link = 1
-- g.vimwiki_folding = 'expr'
-- g.vimwiki_listing_hl = 1
-- -- g.vimwiki_maxhi = 1
-- -- g.vimwiki_hl_headers = 1
-- g.vimwiki_hl_cb_checked = 1
-- g.vimwiki_generated_links_caption = 1
-- g.vimwiki_html_filename_parameterization = 1
-- g.vimwiki_html_header_numbering = 1
-- g.vimwiki_list_ignore_newline = 0
-- g.vimwiki_dir_link = ""
-- g.vimwiki_cycle_bullets = 1
-- g.vimwiki_diary_index = "index"
-- g.vimwiki_diary_start_week_daya = "sunday"
-- g.vimwiki_auto_diary_index = 1
-- g.vimwiki_auto_generate_links = 1
-- g.vimwiki_auto_generate_tags = 1
-- g.vimwiki_auto_header = 1
-- g.vimwiki_auto_tags = 1
-- g.vimwiki_auto_export = 1
-- g.vimwiki_auto_toc = 0
-- vim.cmd[[

-- ]]

-- g.vimwiki_list = {
--   {
--     name = 'mk',
--     path = '~/mk',
--     syntax = 'markdown',
--     ext = '.md',
--     path_html = "~/mk/.html",
--     template_path = "$HOME/mk/.tmpl/",
--     automatic_nested_syntaxes = 1,
--     diary_caption_level = 1,
--     template_ext = ".md",
--     -- bullet_types = [[-,•→]],
--     teplate_path = '~/mk/tmpl/',
--     template_default = "index",
--     auto_diary_index = 1,
--     diary_header = "Entries",
--     auto_generate_links = 1,
--     auto_generate_tags = 1,
--     css_name = "style.css",
--     diary_frequency = "daily",
--     diary_rel_path = "diary/",
--     diary_index = "index",
--     diary_start_week_day = "monday",
--     cycle_bullets = 1,
--     auto_tags = 1,
--     template_date_format = "%Y-%m-%d",
--     rx_todo = 'C<%(TODO|DONE|STARTED|FIXME|FIXED|XXX|NOTE|IMPORTANT)>'
--     --     },{
--     --         name= 'old mk',
--     --         path = '~/mk/archive/1',
--     --         syntax = 'markdown',
--     --         ext = '.md',
--     --         automatic_nested_syntaxes= 1,
--     --         path_html= '~/mk/html',
--     --         diary_caption_level= 1,
--     --         template_ext = ".html",
--     --         -- bullet_types = [[-,•→]],
--     --         teplate_path='~/mk/dev/tpl/html',
--     --         template_default = "index",
--     --         auto_diary_index=1,
--     --         diary_header= "Entries",
--     --         auto_generate_links=1,
--     --         auto_generate_tags=1,
--     --         css_name="style.css",
--     --         diary_frequency="daily",
--     --         diary_rel_path="diary/diary/",
--     --         diary_index="index",
--     --         diary_start_week_day="monday",
--     --         cycle_bullets=1,
--     --         auto_tags=1,
--     --         rwmplrW_Prh = "~/mk/archive/1/templates",
--     --         template_date_format="%Y-%m-%d",
--     --         rx_todo='C<%(TODO|DONE|STARTED|FIXME|FIXED|XXX|NOTE|IMPORTANT)>'
--     -- }, {
--     --     name = "clp",
--     --     path = "~/clp/mk",
--     --     syntax = "markdown",
--     --     ext = '.md',
--     --     automatic_nested_syntaxes= 1,
--     --     path_html= '~/mk/html',
--     --     diary_caption_level= 1,
--     --     template_ext = ".html",
--     --     -- bullet_types = [[-,•→]],
--     --     teplate_path='~/mk/dev/tpl/html',
--     --     template_default = "index",
--     --     auto_diary_index=1,
--     --     diary_header= "Entries",
--     --     auto_generate_links=1,
--     --     auto_generate_tags=1,
--     --     css_name="style.css",
--     --     diary_frequency="daily",
--     --     diary_rel_path="diary/diary/",
--     --     diary_index="index",
--     --     diary_start_week_day="monday",
--     --     cycle_bullets=1,
--     --     auto_tags=1,
--     --     rwmplrW_Prh = "~/mk/archive/1/templates",
--     --     template_date_format="%Y-%m-%d",
--     --     rx_todo='C<%(TODO|DONE|STARTED|FIXME|FIXED|XXX|NOTE|IMPORTANT)>'
--   }
-- }
local augroup = vim.api.nvim_create_augroup
local nmap = function(k, c, o) vim.keymap.set("n", k, c, o) end
local vmap = function(k, c, o) vim.keymap.set("v", k, c, o) end
local aucmd = vim.api.nvim_create_autocmd
function au_enter(group, pattern, callback)
    aucmd("BufRead,BufEnter,BufWinEnter", {
      callback = callback,
      group = group,
      pattern = pattern,
  })
end


local default = { noremap = true, silent = false }

local vwgroup = augroup("Vimwiki", { clear = true })
au_enter(vwgroup, "*.md", function()
  vim.cmd[[
    command! Diary VimwikiDiaryIndex
    augroup vimwikigroup
        autocmd!
        autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
    augroup end
  ]]
  vim.cmd[[
    nmap ,wi <ESC>:silent! VimwikiSearch /- \[ \]/<CR><ESC>:lopen<CR>
    nmap ,wa <ESC>:silent! VimwikiSearch /- \[ \]/<CR><ESC>:lopen<CR>
    nmap ,wt <ESC>:silent! VimwikiSearch /- \[ \]/<CR><ESC>:lopen<CR>
    nmap ,wI <ESC>:silent! VimwikiSearch /- \[ \]/<CR><ESC>:lopen<CR>
    nmap ,wT <ESC>:silent! VimwikiSearch /- \[ \]/<CR><ESC>:lopen<CR>
    nmap ,wgr <ESC>:silent! edit ~/mk/accounts/index.md<CR><CR>
  ]]
  vim.cmd[[ nmap ,wi]]
  nmap(",w,", "<Plug>VimwikiToggleListItem", default)
  vmap(",ww", "<Plug>VimwikiToggleListItem", default)
  nmap(",wo", "<CMD>VimwikiChangeSymbolTo a)<CR>", default)
end)
