vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.number = true
vim.opt.relativenumber = true

vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>qq", ":bd <CR>", {})
vim.keymap.set("n", "<leader>w", ":w <CR>", {})

vim.opt.clipboard = "unnamedplus"

require("config.lazy")
local telescope = require('telescope')

telescope.setup({
  defaults = {
    layout_strategy = 'bottom_pane',
    layout_config = {
      bottom_pane = { height = 0.45 } -- Adjust the height as needed
    }
  }
})

local autocmd = vim.api.nvim_create_autocmd
autocmd('TextYankPost', {
  group = yank_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 100,
    })
  end,
})
