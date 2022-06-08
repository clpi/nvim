local command = vim.api.nvim_create_user_command



local ucmd = function(name, args, exec)
    vim.cmd("command! "  .. args .. " " .. name .. " exe " .. exec .. "")
end

ucmd("Sub", "-nargs=+", "'%s/' . split(<q-args>, ' ')[0] . '/' . split(<q-args>, ' ')[1] . '/g'")
ucmd("S", "-nargs=+", "call('printf', ['%%substitute/%s/%s/g'] + split(<q-args>, ' ')))")
--
--
--
-- Edit a file and make any necessary directories to have it be saveable
--
-- mkdir(iconv(expand("%:p:h"), &encoding, &termencoding), 'p')

-- Creates the directory of current file

-- Open today's diary entry
vim.cmd [[ command! JournalToday exe 'e ~/wiki/diary/diary/'.strftime('%F').'.md']]
vim.cmd [[ command! JournalTodayNested exe 'e ~/wiki/diary/'.strftime('%Y').'/'.strftime('%m').'/'.strftime('%d').'.md']]

vim.cmd [[ command! -nargs=* LuaConfInit exe 'e ~/.config/nvim/init.lua']]
--Convenience command for editing nvim config files
vim.cmd [[ command! -nargs=1 -bang LuaConf exe 'e ~/.config/nvim/lua/<args>.lua']]
vim.cmd [[ command! -nargs=1 -bang Conf exe 'e ~/.config/<args>']]


vim.cmd [[command! -count=1 TermGitPush  lua require'toggleterm'.exec("git push",    <count>, 12)]]
vim.cmd[[command! -count=1 TermGitPushF lua require'toggleterm'.exec("git push -f", <count>, 12)]]



vim.cmd[[command! Just   '!just<CR>']]
-- TODO allow for dir path as arg to look for command with Just!
--      allow for cmd with normal 1st arg       🔍
vim.cmd[[command! Cgmake '!cargo make<CR>']]


vim.cmd[[command! Rg 'Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=> ]]

-- local buf = require("utils").buf

vim.cmd [[ command! -nargs=* BufPath    echo @% ]]
vim.cmd [[ command! -nargs=* BufFile    echo expand('%:t') ]]
vim.cmd [[ command! -nargs=* BufPathAbs echo expand('%:p') ]]
vim.cmd [[ command! -nargs=* BufRelHome echo expand('%:~') ]]
vim.cmd [[ command! -nargs=* BufDirAbs  echo expand('%:p:h') ]]
vim.cmd [[ command! -nargs=* BufRoot    echo expand('%:r') ]]
vim.cmd [[ command! -nargs=* BufExt     echo expand('%:e') ]]
