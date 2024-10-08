vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.relativenumber = true

vim.opt.scrolloff = 10

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("i", "jj", "<Esc>", {})

vim.keymap.set("i", "<C-h>", "<Left>", {})
vim.keymap.set("i", "<C-j>", "<Down>", {})
vim.keymap.set("i", "<C-k>", "<Up>", {})
vim.keymap.set("i", "<C-l>", "<Right>", {})

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("v", "<", "<gv", {})
vim.keymap.set("v", ">", ">gv", {})

vim.keymap.set("n", "<C-h>", ":wincmd h <CR>", {})
vim.keymap.set("n", "<C-j>", ":wincmd j <CR>", {})
vim.keymap.set("n", "<C-l>", ":wincmd l <CR>", {})

vim.keymap.set("n", "<leader>qq", ":bd <CR>", {})

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
            timeout = 40,
        })
    end,
})

vim.keymap.set("n", "<leader>e", "<cmd>e ./<cr>", {})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]
