return {
  'stevearc/oil.nvim',
  config = function()
    require('oil').setup({
      keymaps = {
        ["<Esc>"] = "actions.close"
      },
      view_options = {
        show_hidden = true
      },
    })
  end,
  keys = {
    { '-', '<cmd>Oil<cr>', mode = 'n', desc = "Open Floating Filesystem" },
  }
}
