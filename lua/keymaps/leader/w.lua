-- WIKI CONFIG M.Leader KEYMAPS (,w) --

local M = {}

M.global_todo = { "<CMD>edit ~/mk/todo.md<CR> ", "global todo"}

M.todofn = function(pg)
  return { "<CMD>edit ~/mk/todo/".. pg .. ".md<CR>", pg}
end

M.goalfn = function(pg)
  return { "<CMD>edit ~/mk/goals/".. pg .. ".md<CR>", pg}
end
--
M.goals = { name = "+goals",
  g = { "<ESC>:e ~/mk/goals.md<CR>", "global goals"},
  s = M.goalfn("soon"),
  m = M.goalfn("maybe"),
  o = M.goalfn("oneday"),
  f = { "<ESC>FzfLua live_grep cwd=~/mk/goals<CR>", "grep goals"},
  F = { "<ESC>:e ~/mk/goals.md<CR><ESC>:Telescope current_buffer_fuzzy_grep<CR>", "global todos"},
}
M.todos = { name = "+todos",
  t = { "<ESC>:e ~/mk/todo.md<CR>", "global todo"},
  u = M.todofn("urgent"),
  i = M.todofn("important"),
  h = M.todofn("hobby"),
  f = { "<ESC>FzfLua live_grep cwd=~/mk/todo<CR>", "grep todos"},
  F = { "<ESC>:e ~/mk/todo.md<CR><ESC>:Telescope current_buffer_fuzzy_grep<CR>", "global todos"},
}

M.projects = { name = "+projects",
	["<SPACE>"] = { ":e ~/mk/p/index.md<CR>", "index" },
	["I"] =       { ":e ~/mk/proj/idwplset/index.md.md<CR>", "index" },
  i = { ":e ~/mk/proj/ideas/index.md<CR>", "ideas" },
	p =           { ":e ~/mk/proj/index.md<CR>", "projs" }
}

M.templates = { name = "+templates", 
	["<SPACE>"] = { ":FzfLua files cwd=~/mk/tmpl<CR>", "find" },
	i = { ":e ~/mk/tmpl/index.md<CR>", "index" },
	r = { ":e ~/mk/tmpl/rust/index.md<CR>", "rust"},
	n = { ":e ~/mk/tmpl/nim/index.md<CR>", "nim"},
	z = { ":e ~/mk/tmpl/zig/index.md<CR>", "zig"},
	c = { ":e ~/mk/tmpl/c/index.md<CR>", "c/c++"},
	s = { ":e ~/mk/tmpl/sh/index.md<CR>", "sh"},
}

M.snippets =  { name = "+snippets",
	["<SPACE>"] = { ":e ~/mk/bm//index.md<CR>", "general" },
	r = { ":e ~/mk/dev/snippets/rust/snippets/inde.md<CR>", "rust"},
	n = { ":e ~/wik/dev/snippets/nim/index.md<CR>", "nim"},
	z = { ":e ~/wik/dev/snippets/zig/index.md<CR>", "zig"},
	c = { ":e ~/mk/dev/snippets/ccpp/index.md<CR>", "c/c++"},
	s = { ":e ~/mk/dev/snippets/sh/index.md<CR>", "sh"},
	p = { ":e ~/mk/dev/snippets/sh/py.md<CR>", "sh"},
	v = { ":e ~/mk/templats/vimwiki/index.md<CR>", "vimwiki" },
	S = { ":e ~/mk/templats/svelte/index.md<CR>", "svelte" }
}

M.find ={ name = "+find",
  f = { "<CMD>FzfLua files cwd=~/mk<CR>", "fzf"},
  ["<CR>"] = { "<CMD>FzfLua files cwd=~/mk<CR>", "fzf"},
  p = { "<CMD>Telescope wiki pages<CR>", "wiki pages"},
  g = { "<CMD>Telescope wiki grep<CR>", "wiki pages"},
  l = { "<CMD>Telescope wiki links<CR>", "wiki pages"},
  t = { "<ESC>:VimwikiSearchTags<SPACE>", "tags prompt"},
  s = { "<ESC>:VimwikiSearch<SPACE>", "search prompt"},
}
M.code = { name = "+code",
	["<SPACE>"] = { ":e ~/mk/dev/index.md<CR>", "index" },
	r = { ":e ~/mk/dev/rust/index.md<CR>", "rust"},
	n = { ":e ~/mk/dev/nim/index.md<CR>", "nim"},
	z = { ":e ~/mk/dev/zig/index.md<CR>", "zig"},
	c = { ":e ~/mk/dev/c/index.md<CR>", "c/c++"},
	s = { ":e ~/mk/tmpl/sh/index.md<CR>", "sh"},
	["-"] = { ":e ~/mk/dev/index.md<CR><ESC>:Telescope find_files<CR>", "find_files"},
	["/"] = { ":e ~/mk/dev/index.md<CR><ESC>:Telescope live_grep<CR>", "live_grep"},
	["?"] = { ":e ~/mk/dev/index.md<CR><ESC>:Telescope fd<CR>", "fd"},
	["."] = { ":e ~/mk/dev/index.md<CR><ESC>:Telescope file_browser<CR>", "file_browser"},
}
M.bookmarks = { name = "+bmarks",
  a = { ":e ~/mk/accounts/index.md<CR>", "accouns"},
  k = { ":e ~/mk/keys/index.md<CR>", "kes"},
  r = { ":e ~/mk/res/index.md<CR>", "res"},
	  i = { ":e ~/mk/bm/index.md<CR>", "index"},
	  n = { ":e ~/mk/bm/nim/index.md<CR>", "nim"},
	  z = { ":e ~/mk/bm/zig/index.md<CR>", "zig"},
	  c = { ":e ~/mk/bm/ccPP/index.md<CR>", "c/c++"},
	  s = { ":e ~/mk/bm/sh/index.md<CR>", "sh"},
	  p = { ":e ~/mk/bm/py/index.md<CR>", "py"},
}
M.new = { name = "+new",
	    r = { ":e ~/mk/dev/snippets/rust/<CR>", "rust"},
	    n = { ":e ~/mk/dev/snippets/nim/<CR>", "nim"},
	    z = { ":e ~/mk/dev/snippets/zig/<CR>", "zig"},
	    c = { ":e ~/mk/dev/snippets/ccpp<CR>", "c/c++"},
	    s = { ":e ~/mk/dev/snippets/sh/<CR>", "sh"},
	    p = { ":e ~/mk/dev/snippets/py/<CR>", "sh"},
}
M.diary = { name = "+diary",
	["<SPACE>"] = { ":VimwikiDiaryIndex<CR>", "index" },
	["<CR>"] = { ":VimwikiMakeDiaryNote<CR>", "daily note"},
	["<S-Tab>"] = { ":VimwikiYesterdayMakeDiaryNote<CR>", "yesterday note"},
	["<TAB>"] = { ":VimwikiTomorrowMakeDiaryNote<CR>", "tomorrow note"},

	["-"] = { ":e ~/mk/diary/diary/index.md CR><ESC>:Telescope fd", "find diary files"},
	["/"] = { ":e ~/mk/diary/diary/index.md CR><ESC>:Telescope find_files", "live grep"},
	["?"] = { ":e ~/mk/diary/diary/index.md CR><ESC>:Telescope find_files", "fd"},

	["["] = { ":VimwikiMakeYesterdayDiaryNote<CR>", "yesterday note"},
	["]"] = { ":VimwikiMakeTomorrowDiaryNote<CR>", "tomorrow note"},

	["<"] = { ":VimwikiMakeYesterdayDiaryNote<CR>", "yesterday note"},
	[">"] = { ":VimwikiMakeTomorrowDiaryNote<CR>", "tomorrow note"},
	[","] = { ":VimwikiDiaryPrevDay<CR>", "yesterday note"},
	["."] = { ":VimwikiDiaryNextDay<CR>", "tomorrow note"},
	h = { ":VimwikiDiaryPrevDay<CR>", "yesterday note"},
	l = { ":VimwikiDiaryNextDay<CR>", "tomorrow note"},
	H = { ":VimwikiYesterdayMakeDiaryNote<CR>", "yesterday note"},
	L = { ":VimwikiTomorrowMakeDiaryNote<CR>", "tomorrow note"},
	j = {  ":JournalToday<CR>", 'journal today' },
	J = {  ":JournalTodayAlt<CR>", 'today nested' },
	M = { ":e ~/mk/templates/vimwiki/diary_entry.md<CR>", "diary template"},
	T = { ":e ~/mk/templates/diary.tpl<CR>", "diary template"},
	n = { ":VimwikiMakeDiaryNote<CR>", "daily note"},
  N = { ":JournalToday<CR>", "daily note"},
}

M.table = { name = "+table",
  ["<CR>"] = { "<CMD>VimwikiTable<CR>", "create" },
  ["\\"] = { "<CMD>VimwikiTable<CR>", "create" },
  ["<SPACE>"] = { "<CMD>VimwikiTable<CR>", "create" },
  n = { "<CMD>VimwikiTable<CR>", "create" },
  c = { "<CMD>VimwikiTable<CR>", "create" },
  q = { "<CMD>VimwikiTableAlignQ<CR>", "align Q" },
  w = { "<CMD>VimwikiTableAlignW<CR>", "create table" },
  h = { "<CMD>VimwikiTableMoveColumnLeft<CR>", "move col left" },
  l = { "<CMD>VimwikiTableMoveColumnRight<CR>", "mov col right" },
  [","] = { "<CMD>VimwikiTableMoveColumnLeft<CR>", "move col left" },
  ["."] = { "<CMD>VimwikiTableMoveColumnRight<CR>", "mov col right" },
  ["<"] = { "<CMD>VimwikiTableMoveColumnLeft<CR>", "move col left" },
  [">"] = { "<CMD>VimwikiTableMoveColumnRight<CR>", "mov col right" },

}

M.links = {
  s = { "<CMD>VimwikiSplitLink<CR>", "split",},
  c = { "<CMD>VimwikiCheckLinks<CR>", "check"},
  p = { "<CMD>VimwikiPasteLink<CR>", "paste link"},
  u = { "<CMD>VimwikiPasteUrl<CR>", "paste url"},
  C = { "<CMD>VimwikiCatUrl<CR>", "cat url"},
  R = { "<CMD>VimwikiRss<CR>", "rss"},
  a = { "<CMD>VimwikiBaddLink<CR>", "badd link"},
  r = { "<CMD>VimwikiRenameLink<CR>", "badd link"},
  t = { "<CMD>VimwikiTabnewLink<CR>", "tabnew link"},
  v = { "<CMD>VimwikiVSplitLink<CR>", "vsplit link"},
  n = { "<CMD>VimwikiNormalizeLink<CR>", "vsplit link"},
  l = { "<CMD>VimwikiDeleteLink<CR>", "del link"},
  b = { "<CMD>VimwikiBacklinks<CR>", "back links"},
  g = { "<CMD>VimwikiGenerateLinks<CR>", "gen links"},
  G = { "<CMD>VimwikiGenerateLinkItems<CR>", "gen link items"},

}

M.toggle = { name = "+toggle", 
  r = { "<CMD>VimwikiToggleRejectedListItem<CR>" , "rej list item"},
  v = { "<CMD>VimwikiVar<CR>" , "var"},
  s = { "<CMD>VimwikiUiSelect<CR>" , "ui select"},
  l = { "<CMD>VimwikiToggleList<CR>", "list" },
  i = { "<CMD>VimwikiToggleListItem<CR>", "list item" },
  c = { name = "+colorize",
    r = {"<CMD>VimwikiColorize red<CR>", "red" },
    R = {"<CMD>VimwikiColorize bred<CR>", "bred" },
    b = {"<CMD>VimwikiColorize blue<CR>", "blue" },
    B = {"<CMD>VimwikiColorize bblue<CR>", "bblue" },
    g = {"<CMD>VimwikiColorize green<CR>", "green" },
    G = {"<CMD>VimwikiColorize bgreen<CR>", "bgreen" },
    y = {"<CMD>VimwikiColorize yellow<CR>", "yellow" },
    Y = {"<CMD>VimwikiColorize byellow<CR>", "byellow" },
    o = {"<CMD>VimwikiColorize orange<CR>", "orange" },
    O = {"<CMD>VimwikiColorize borange<CR>", "borange" },
    p = {"<CMD>VimwikiColorize purple<CR>", "purple" },
    P = {"<CMD>VimwikiColorize bpurple<CR>", "bpurple" },
    a = {"<CMD>VimwikiColorize gray<CR>", "gray" },
    A = {"<CMD>VimwikiColorize bgray<CR>", "bgray" },

  },
}

M.rename = { name = "+rename",
  f = { "<CMD>VimwikiRenameFile<CR>", "file",},
  l = { "<CMD>VimwikiRenameLink<CR>", "link",},
  n = { "<CMD>VimwikiRenumberAllLists<CR>", "renumber all lists",}
}

M.gen = { name = "+generate", 
  T = { "<CMD>VimwikiTOC<CR>", "toc"},
  l = { "<CMD>VimwikiGenerateLinks<CR>", "links" },
  d = { "<CMD>VimwikiDiaryGenerateLinks<CR>", "links" },
  L = { "<cmd>VimwikiGenerateTagLinks<cr>", "tag links" },
  t = { "<cmd>VimwikiGenerateTags<cr>", "tags" },
  r = { "<cmd>VimwikiRebuildTags<cr>", "rebuild tags" },
}

M.delete = { name = "+delete",
  f = { "<CMD>VimwikiDeleteFile<CR>", "file",},
  l = { "<CMD>VimwikiDeleteLink<CR>", "link"},
  d = { "<CMD>VimwikiRemoveDone<CR>", "remove done"},
  c = { "<CMD>VimwikiRemoveSingleCB<CR>", "remove checkbox" },
  C = { "<CMD>VimwikiRemoveCBInList<CR>", "remove cb in list"},
}

M.n ={ maps = { name = "+wiki",
    ["<SPACE>"] = M.toggle,
    ["<CR>"] = {"<ESC>:VimwikiGoto<SPACE>", "prompt goto"},
    ["_"] = { ":e ~/mk/index.md<CR><ESC>:Telescope file_browser theme=dropdown path=~/mk<CR>", "file_browser"},
    ["<TAB>"] = { "<CMD>DBUIToggle<CR>", "toggle mkdb" },

    ["<BS>"] = { "<CMD>VimwikiGoBackLink<CR>", "go back"},


    [","] = { ":e ~/mk/index.md<CR><ESC>:Telescope find_files<CR>", "find_files"},
    ["."] = { ":e ~/mk/index.md<CR><ESC>:Telescope find_files<CR>", "find_files"},

    ["/"] = { "<CMD>Telescope wiki pages<CR>", "wiki pages"},
    F = { "<CMD>Telescope wiki grep<CR>", "wiki pages"},
    L = { "<CMD>Telescope wiki links<CR>", "wiki pages"},

    T = { "<CMD>edit ~/mk/todo.md<CR>", "TODO"},
    G = { "<CMD>edit ~/mk/goals.md<CR>", "GOALS"},
    P = { "<CMD>edit ~/mk/proj.md<CR>", "PROJECTS"},

    [";"] = { "<CMD>FzfLua files cwd=~/mk<CR>", "file_browser"},
    l = M.links,
    m = M.gen,
    d = M.diary,
    s = M.snippets,
    g = M.goals,
    p = M.projects,
    t = M.todos,
    M = M.templates,
    c = M.code,
    f = M.find,
    n = M.new,
    b = M.bookmarks,
    D = M.delete,
    x = M.delete,
    B = M.table,
    r = M.rename,
    R = { "<CMD>VimwikiRenameLink<CR>", "rename link"},
    ["="] = M.table,
    ["-"] = { "<CMD>VimwikiDecrementListItem<CR>", "decr list"},
    ["+"] = { "<CMD>VimwikiIncrementListItem<CR>", "incr list"},
    ["|"] = { "<CMD>VimwikiTable<CR>", "create table"},
    ["\\"] = { "<CMD>VimwikiTable<CR>", "rename link"},
    i = { ":e ~/mk/index.md<CR>", "index"},
    j = { ":e ~/mk/journal.txt<CR>", "journal"},
    a = { ":e ~/mk/auth/index.md<CR>", "auth"},
    C = { ":e ~/mk/creds/index.md<CR>", "credentials"},
    V = { ":e ~/mk/idlets/index.md<CR>", "idlets"},
    I = { ":e ~/mk/devisa/index.md<CR>", "devisa"},
    -- J = { ":e ~/mk/jobs/index.md<CR>", "jobs"},
    -- l = { ":e ~/mk/diary/log/index.md<CR>", "log"},
    N = { ":JournalTodayAlt<CR>", "daily note nested"},
},
    opts = require("keymaps.common").opts.n("w"), 
 }


M.v = {
    maps = M.n.maps,
    opts = require("keymaps.common").opts.v("w"),
}

return M
