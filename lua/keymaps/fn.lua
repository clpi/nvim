local function nm(k, c, o) vim.keymap.set({"n"}, k, c, o) end
local default = { noremap = true }

nm("<F1>", "<ESC>:TermExec cmd='just '", default)
nm("<F2>", "<ESC>:TermExec cmd='just '", default)
nm("<F3>", "<ESC>:TermExec cmd='just '", default)
nm("<F4>", "<ESC>:TermExec cmd='just '", default)
nm("<F5>", "<ESC>:TermExec cmd='just '", default)
nm("<F6>", "<ESC>:TermExec cmd='just '", default)
nm("<F7>", "<ESC>:TermExec cmd='just '", default)
nm("<F8>", "<ESC>:TermExec cmd='just '", default)
nm("<F9>", "<ESC>:TermExec cmd='just '", default)
nm("<F10>", '<ESC>:TermExec cmd=""<LEFT>', default)
nm("<F11>", '<ESC>:make ', default)
nm("<F12>", "<ESC>:Zi<CR>", default)

nm("<S-F1>", '<ESC>:TermExec cmd=""<LEFT>', default)
nm("<S-F2>", '<ESC>:TermExec cmd=""<LEFT>', default)
nm("<S-F3>", '<ESC>:TermExec cmd=""<LEFT>', default)
nm("<S-F4>", '<ESC>:TermExec cmd=""<LEFT>', default)
nm("<S-F5>", '<ESC>:TermExec cmd=""<LEFT>', default)
nm("<S-F6>", '<ESC>:TermExec cmd=""<LEFT>', default)
nm("<S-F7>", '<ESC>:TermExec cmd=""<LEFT>', default)
nm("<S-F8>", '<ESC>:TermExec cmd=""<LEFT>', default)
nm("<S-F9>", '<ESC>:TermExec cmd=""<LEFT>', default)
nm("<S-F10>", '<ESC>:TermExec cmd=""<LEFT>', default)
nm("<S-F11>", '<ESC>:TermExec cmd=""<LEFT>', default)
