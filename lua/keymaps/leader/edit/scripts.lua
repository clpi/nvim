--! EDIT > SCRIPTS SETTINGS AND KEYMAPS  [<space>es] !--

local M = {}

local sdir = "~/wiki/dev/scripts"
local scripts = function(rpath, page, name) return
    { ":e "..sdir.."/"..rpath.."/"..page..".md<CR>", name }
end
local tele_op = function(root, op, name) return
    {  ':e '..root..'index.md<CR><ESC>:Telescope '..op..'<CR>', name }
end

--- NOTE: For code scripts indexes
M.n = { maps = { name = "+scripts",
      ["<space>"] = scripts("index", "index"),
      ["<TAB>"]   = tele_op(sdir, "fd", "fd scripts"),
      ["<CR>"]    = tele_op(sdir, "find_files", "find scripts"),
      ["/"]       = tele_op(sdir, "live_grep", "grep scripts"),
      ["?"]       = tele_op(sdir, "current_buffer_fuzzy_find", "fuzzy find"),
      [","]       = tele_op(sdir, "file_browser", "file browser"),
      ["."]       = tele_op(sdir, "grep_string", "grep string"),
      c   	  = scripts("c", "index", "C"),
      g  	  = scripts("go", "index", "go"),
      j  	  = scripts("js", "index", "javascript"),
      r  	  = scripts("rust", "index", "rust"),
      p  	  = scripts("python", "index", "python"),
      s  	  = scripts("shell", "index", "bash"),
      h  	  = scripts("haskell", "index", "haskell"),
      k  	  = scripts("kotlin", "index", "kotlin"),
      l  	  = scripts("lua", "index", "lua"),
      m  	  = scripts("scala", "index", "scala"),
      n  	  = scripts("nim", "index", "nim"),
      o           = scripts("ocaml", "index", "ocaml"),
      t  	  = scripts("ts", "index", "typescript"),
      w = { name = "+web",
	r =         scripts("react", "index", "react"),
	s = 	    scripts("svelte", "index", "svelte"),
	n = 	    scripts("next", "index", "next.js"),
	v =         scripts("vue", "index", "vue")
      },
      z = 	    scripts("zig", "index", "zig"),
      C = 	    scripts("cpp", "index", "C++"),
      D =           scripts("d", "index", "D"),
      H = 	    scripts("html", "index", "HTML"),
      I = { name = "+init",
	m = scripts("init", "macos", "index")
      },
      S = 	    scripts("css", "index", "CSS"),
      F = 	    scripts("swift", "index", "swift"),
      L = 	    scripts("clojure", "index", "clojure"),
      J = 	    scripts("java", "clojure"),
      K = 	    scripts("racket", "index", "racket"),
} }

M.v = M.n

return M
