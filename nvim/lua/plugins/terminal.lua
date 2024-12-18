vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

local state = {
  floating = {
    buf = -1,
    win = -1,
  },
}

function create_floating_window(opts)
  -- Default options
  opts = opts or {}
  opts.width = opts.width or math.floor(vim.o.columns * 0.8)
  opts.height = opts.height or math.floor(vim.o.lines * 0.8)

  -- Get the current screen dimensions
  local screen_width = vim.o.columns
  local screen_height = vim.o.lines

  -- Default position: centered
  local row = math.floor((screen_height - opts.height) / 2)
  local col = math.floor((screen_width - opts.width) / 2)

  -- Create the floating window
  local buf = nil

  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true) -- create a new buffer
  end

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = opts.width,
    height = opts.height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded", -- You can also use 'none', 'single', 'double', etc.
  })

  -- Optional: Set window-specific options (e.g., no line numbers)
  vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
  vim.api.nvim_win_set_option(win, "number", false)
  vim.api.nvim_win_set_option(win, "relativenumber", false)

  return { win = win, buf = buf }
end

local toggle_terminal = function()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = create_floating_window({ buf = state.floating.buf })
    if vim.bo[state.floating.buf].buftype ~= "terminal" then
      vim.cmd.term()
    end
  else
    vim.api.nvim_win_hide(state.floating.win)
  end
end

vim.api.nvim_create_user_command("Floaterminal", toggle_terminal, {})

vim.keymap.set({ "n", "t" }, "<A-i>", toggle_terminal)
