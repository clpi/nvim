vim.filetype.add({
  extension = {
    norg = "norg",
    org = "org",
    md = "markdown",
    just = "just",
    purs = "purescript",
    cr = "crystal",
    iv = "ivel",
    vd = "iveldef",
    v  = "V",
    -- h = function(path, bufnr)
    --     if vim.fn.search("\\C^#include <[^>.]\\+>$", "nw") ~= 0 then
    --         return "cpp"
    --     end
    --     return "c"
    -- end,
  },

  filename = {
    -- ["kitty.cfg"] = "config",
  },
  pattern = {
    ["~/.config/sway/config"] = "i3config",
    ["~/.config/i3/config"] = "i3config",
  }
})
