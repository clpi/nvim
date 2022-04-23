-- Adapted from https://github.com/ElPiloto/telescope-vimwiki.nvim

local pickers = require'telescope._extensions.wiki.pickers'

return require'telescope'.register_extension{
  exports = {
    pages = pickers.wiki_pages,
    grep = pickers.wiki_grep,
    links = pickers.wiki_link,
  }
}

