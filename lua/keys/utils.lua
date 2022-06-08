local M = {}

M.edit = function(file, name)
  return { "<CMD>edit " .. file .. "<CR>", name}
end

M.tele = function(cmd, args, name)
  local cmdstr, cmd_name = "<CMD>Telescope " .. 
    cmd  .. " " .. args  .. "<CR>", ""
  if name then cmd_name = name
  else cmd_name = cmd
  end
  return { cmdstr, cmd_name }
end

-- @Wrapper function for opt table
M.opts = function(mode, pre, sil, nore, expr, buf) return 
  { 
    mode = mode,
    pre = pre,
    silent = sil,
    noremap = nore,
    expr = expr,
    buffer = buf,
  } end

-- @Global opts, assumes buffer is false
M.gopts = {
  n = function(p, s, n, e) return M.opts("n", p, s, n, e, false) end,
  v = function(p, s, n, e) return M.opts("v", p, s, n, e, false) end,
  i = function(p, s, n, e) return M.opts("i", p, s, n, e, false) end,
  c = function(p, s, n, e) return M.opts("c", p, s, n, e, false) end,
}

M.cmd = function(cmd, name)
  return { "<CMD>" .. cmd .. "<CR>", name }
end

return M

