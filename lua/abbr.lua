local M = {}

M.abbr = function(mode, abb, res)
  vim.cmd(mode .. "ab " .. abb .. " " .. res)
end

M.set_abbrs = function()
  M.abbr("c", "fz", "FzfLua ")
  M.abbr("c", "fzf", "FzfLua files")
  M.abbr("c", "fzf", "FzfLua files")
  M.abbr("c", "tl", "Telescope ")
  M.abbr("c", "linf", "LspInfo")
  M.abbr("c", "lins", "LspInstall ")
  M.abbr("c", "liinf", "LspInstallInfo")
  M.abbr("c", "tx", "TermExec")
  M.abbr("c", "txc", "TermExec")
  M.abbr("c", "sr", "%s///g")
  M.abbr("c", "sbr", "SearchBoxReplace")
  M.abbr("c", "fr", "%s///g")
  M.abbr("c", "vw", "Vimwiki")
  M.abbr("c", "tsci", "TSConfigInfo")
  M.abbr("c", "tsin", "TSInstall")
  M.abbr("c", "vws", "VimwikiUiSelect")
  M.abbr("c", "vwv", "VimwikiVar")
  M.abbr("c", "vwi", "VimwikiIndex")
  M.abbr("c", "vwdi", "VimwikiDiaryIndex")
  M.abbr("c", "vwdtm", "VimwikiMakeTomorrowDiaryNote")
  M.abbr("c", "vwdye", "VimwikiMakeYesterdayDiaryNote")
  M.abbr("c", "vwdmt", "VimwikiMakeDiaryNote")
  M.abbr("c", "vwd", "VimwikiDiary")
  M.abbr("c", "cmps", "CmpStatus")
  M.abbr("c", "cop", "Copilot")
  M.abbr("c", "ae", "Aerial")
  M.abbr("c", "aer", "Aerial")
  M.abbr("c", "sym", "SymbolsOutline")
  M.abbr("c", "sym", "SymbolsOutline")
  M.abbr("c", "symt", "SymbolOutlineToggle")
  M.abbr("c", "tt", "TroubleToggle ")
  M.abbr("c", "txc", "TermExec cmd=''<LEFT>")
end


vim.cmd[[
  command! Tx -nargs=1 -complete=custom,TermExecComplete call TermExec(<q-args>0)
]]

return M
