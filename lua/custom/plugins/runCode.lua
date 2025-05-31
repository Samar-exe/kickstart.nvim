local state = {
  floating = {
    buf = -1,
    win = -1,
  },
}

local function open_floating_window(opts)
  opts = opts or {}
  local width = opts.width or math.ceil(vim.o.columns * 0.8)
  local height = opts.height or math.ceil(vim.o.lines * 0.8)

  local row = math.ceil((vim.o.lines - height) / 2)
  local col = math.ceil((vim.o.columns - width) / 2)

  local buf
  if vim.api.nvim_buf_is_valid(opts.buf or -1) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end

  local win_config = {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded',
  }

  local win = vim.api.nvim_open_win(buf, true, win_config)

  return { buf = buf, win = win }
end

local function RunCode()
  local filetype = vim.api.nvim_win_call(0, function()
    return vim.bo.filetype
  end)

  local fileName = vim.api.nvim_buf_get_name(0)
  local cmd = nil
  if filetype == 'python' then
    cmd = string.format('python %s', fileName)
  elseif filetype == 'lua' then
    cmd = string.format('lua %s', fileName)
  elseif filetype == 'java' then
    local className = fileName:match '([^/]+)%.java$' -- Extract class name from filename
    cmd = string.format('javac %s && java %s', fileName, className)
  elseif filetype == 'sh' or filetype == 'bash' then
    cmd = string.format('bash %s', fileName)
  elseif filetype == 'javascript' then
    cmd = string.format('node %s', fileName)
  else
    print('Unsupported filetype: ' .. filetype)
    return
  end
  return cmd
end

local function toggle_terminal()
  local command = RunCode()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = open_floating_window { buf = state.floating.buf }

    -- Ensure the buffer is a terminal
    if vim.bo[state.floating.buf].buftype ~= 'terminal' then
      vim.cmd { cmd = 'terminal', args = { command } }
    end
  else
    vim.api.nvim_win_hide(state.floating.win)
  end
end

-- vim.api.nvim_create_user_command('Run', toggle_terminal(cmd), {})
vim.api.nvim_create_user_command('Run', toggle_terminal, {})

vim.keymap.set({ 'n', 't' }, '<leader>fr', toggle_terminal)
return {}
