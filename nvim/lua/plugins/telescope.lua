return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n','<leader>ff', builtin.find_files, {})
      vim.keymap.set('n','<leader>fb', builtin.buffers, {})
      vim.keymap.set('n','<leader>fs', builtin.current_buffer_fuzzy_find, {})
      vim.keymap.set('n','<leader>fw', builtin.live_grep, {})
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {

            }
          }
        },
      })
      require("telescope").load_extension("ui-select")
    end
  }
}
