vim.g.copilot_enabled = true
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = "<C-g>"

local map = vim.api.nvim_set_keymap

-- map("i", "<C-p>", "copilot#Accept('<CR>')", { expr = true, script = true, silent = true })
-- map("i", "<C-m>", "copilot#Accept('<CR>')", { expr = true, script = true, silent = true })
map("i", "<C-l>", "copilot#Accept('<CR>')", { expr = true, script = true, silent = true })
map("i", "<C-h>", "copilot#Dismiss()", { expr = true, script = true, silent = true })
map("i", "<C-s>", "copilot#Clear()", { expr = true, script = true, silent = true })

map("i", '<C-b>', "copitlot#Browser()", { expr = true, script = true, silent = true })

map("i", "<C-Tab>", "copilot#Next()", { expr = true, script = true, silent = true })
map("i", "<C-S-Tab>", "copilot#Previous()", { expr = true, script = true, silent = true })
-- map("i", '<C-k>', "copilot#Accept('<CR>')", { expr = true, script = true, silent = true })
-- vim.cmd [[ highlight CopilotSuggestion guifg=#434a58 ]]
-- vim.cmd[[ highlight CopilotSuggestion guifg=#575268 ]]
vim.g.copilot_filetypes = {
  ["*"] = true,
  ["c"] = true,
  python = true
}


vim.g.copilot_enabled = true
-- vim.cmd("augroup copilot")
