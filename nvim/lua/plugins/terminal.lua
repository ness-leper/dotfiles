return {
  "numToStr/FTerm.nvim",
  config = function()
    require("FTerm").setup({
      border = "single",
      dimensions = {
        height = 0.7,
        width = 0.7,
      },
    })

    vim.keymap.set("n", "<leader>i", '<CMD>lua require("FTerm").toggle()<CR>')
    vim.keymap.set("t", "<leader>i", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
  end,
}
