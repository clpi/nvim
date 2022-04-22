vim.filetype.add({
  extension = {
    norg = "norg",
    org = "org",
    md = "markdown",
    just = "just",
    iv = "ivel",
    vd = "iveldef",
    extension = {
        h = function(path, bufnr)
            if vim.fn.search("\\C^#include <[^>.]\\+>$", "nw") ~= 0 then
                return "cpp"
            end
            return "c"
        end,
    },
  },

  filename = {
    ["kitty.cfg"] = "config",
  },
  pattern = {
    ["~/%.config/sway/config"] = "i3config",
  }
})
