local installedLSPs = { "lua_ls", "gopls", "html", "superhtml", "templ" }

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o> if you're not using nvim-cmp/etc.
  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Buffer local mappings.
  -- See `:help vim.lsp.*` for documentation on these functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr } -- bufnr makes it buffer-local!
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to Definition', buffer = bufnr })
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to Declaration', buffer = bufnr })
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = 'Go to Implementation', buffer = bufnr })
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { desc = 'Go to Type Definition', buffer = bufnr })
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'Go to References', buffer = bufnr })
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Information', buffer = bufnr })
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { desc = 'Signature Help', buffer = bufnr })
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, { desc = 'Rename', buffer = bufnr })
  vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, { desc = 'Code Action', buffer = bufnr }) -- Common binding for code actions
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, { desc = 'Format Code', buffer = bufnr }) -- Requires a formatter server capability

  -- Diagnostic keymaps
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous Diagnostic', buffer = bufnr })
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next Diagnostic', buffer = bufnr })
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { desc = 'Show Diagnostic', buffer = bufnr })
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, { desc = 'Set Diagnostic Loclist', buffer = bufnr })

  -- ... add any other buffer-local LSP keymaps here
end

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = installedLSPs
      })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp' },

    opts = {
      servers = {
        lua_ls = {},
        gopls = {},
      }
    },
    config = function(_, opts)
      local lspconfig = require('lspconfig')
      for server, config in pairs(opts.servers) do
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        config.on_attach = on_attach
        lspconfig[server].setup(config)
      end
    end,
  }
}
