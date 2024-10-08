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

    vim.keymap.set("n", "<C-i>", '<CMD>lua require("FTerm").toggle()<CR>')
    vim.keymap.set("t", "<C-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
  end,
}
