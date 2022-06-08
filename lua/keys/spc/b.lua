local wk = require("which-key")
local M={}

M.n = { name = "+buf",
  k = { "<CMD>BufferKill<CR>", "bkill" },
  ["1"] = { "<Cmd>BufferLineGoToBuffer 1<CR>", "goto b1"},
  ["2"] = { "<Cmd>BufferLineGoToBuffer 2<CR>", "goto b2"},
  ["3"] = { "<Cmd>BufferLineGoToBuffer 3<CR>", "goto b3"},
  ["4"] = { "<Cmd>BufferLineGoToBuffer 4<CR>", "goto b4"},
  ["5"] = { "<Cmd>BufferLineGoToBuffer 5<CR>", "goto b5"},
  ["6"] = { "<Cmd>BufferLineGoToBuffer 6<CR>", "goto b6"},
  ["7"] = { "<Cmd>BufferLineGoToBuffer 7<CR>", "goto b7"},
  ["8"] = { "<Cmd>BufferLineGoToBuffer 8<CR>", "goto b8"},
  ["9"] = { "<Cmd>BufferLineGoToBuffer 9<CR>", "goto b9"},
  ["<TAB>"] = { ":b<SPACE><TAB>", "b"},
  ["<space>"] = { ":BufferLinePick<CR>", "pick"},
  ["<"] = { ":BufferLineMovePrev", "move <"},
  [">"] = { ":BufferLineMoveNext", "move >"},
  ["("] = { ":BufferLineCloseLeft", "close <"},
  [")"] = { ":BufferLineCloseRight", "close >"},
  ["-"] = { ":BufferLineCyclePrev", "cycle <"},
  ["_"] = { ":BufferLineCycleNext", "cycle >"},
  ["."] = { ":bnext<CR>", "next"},
  [","] = { ":bprev<CR>", "prev"},
  ["?"] = { ":buffers<CR>", "buffers"},
  g = { "<ESC>:FzfLua blines<CR>", "blines"},
  b = { ":Telescope buffers theme=dropdown<CR>", "bufs"},
  P = { ":BufferLineMovePrev", "move <"},
  N = { ":BufferLineMovePrev", "move >"},
  n = { ":BufferLineCycleNext", "cycle >"},
  p = { ":BufferLineCyclePrev", "cycle <"},
  d = { ":Bdelete<CR>", "delete"},
  q = { ":lua require('bufdelete').bufdelete(0, true)", "bufdelete"},
  D = { ":Bdelete<CR>", "delete"},
  t = { ":BufferLineGroupToggle<Space>", "group toggle"},
  x = { ":BufferLinePickClose", "close"},
  c = { name = "+close",
      g = { ":BufferLineGroupClose<CR>", "group"},
      ["1"] = { "<Cmd>BufferLinePickClose 1<CR>", "close 1"},
      ["2"] = { "<Cmd>BufferLinePickClose 2<CR>", "close 2"},
      ["3"] = { "<Cmd>BufferLinePickClose 3<CR>", "close 3"},
      ["4"] = { "<Cmd>BufferLinePickClose 4<CR>", "close 4"},
      ["5"] = { "<Cmd>BufferLinePickClose 5<CR>", "close 5"},
      ["6"] = { "<Cmd>BufferLinePickClose 6<CR>", "close 6"},
      ["7"] = { "<Cmd>BufferLinePickClose 7<CR>", "close 7"},
      ["8"] = { "<Cmd>BufferLinePickClose 8<CR>", "close 8"},
      ["9"] = { "<Cmd>BufferLinePickClose 9<CR>", "close 9"},
  },
  s = { name = "+sort",
    t = { ":BufferLineSortByTabs", "by tab"},
    e = { ":BufferLineSortByExtension", "by ext"},
    r = { ":BufferLineSortByRelativeDirectory", "by relative dir"},
    d = { ":BufferLineSortByDirectory", "by dir"},
  }

}
return M
