local U = {}

U.fmt = function(cmd, title)
  return { cmd, title }
end

U.cfmt = function(cmd, title)
  return { "<CMD>" .. cmd .. "<CR>", title }
end

U.find = function(finder, cmd, opts, title)
  if finder then
    if cmd then
      if opts then opts = opts else opts = "" end
      if title then title = title else title = cmd end
      return U.cfmt(finder .. " " .. cmd .. " " .. opts, title)
    else print("ERROR: Need at least cmd"); return { }
    end
  else print("Need finder"); return {}
  end
end

U.tel = function(cmd, opts,title) return U.find("Telescope", cmd, opts, title) end

U.fzf = function(cmd, opts,title) return U.find("FzfLua", cmd, opts, title) end

return U
