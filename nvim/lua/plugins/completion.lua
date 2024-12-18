return {
  {
    'saghen/blink.cmp',
    dependencies = {
      'rafamadriz/friendly-snippets',
      "folke/lazydev.nvim",
    },

    version = 'v0.*',
    opts = {
      keymap = { preset = 'default' },

      appearance = {
        use_nvim_cmp_as_default = true,
       nerd_font_variant = 'mono'
      },

      sources = {
        completion = {
          enabled_providers = { "lsp", "path", "snippets", "buffer", "lazydev" },
        },
        providers = {
          lsp = { fallback_for = { "lazydev" } },
          lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
        }
        -- default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      completion = {
        accept = { auto_brackets = { enabled = true } },
        trigger = {
          show_on_insert_on_trigger_character = false,
        },
        menu = {
          border = vim.g.border_style,
          scrolloff = 1,
          scrollbar = false,
          columns = { { 'kind_icon' }, { 'label', 'label_description', gap = 0 } },

          draw = {
            padding = 0,
            gap = 1,
            treesitter = true,
          }
        },
      },

      documentation = {
        auto_show_delay_ms = 0,
        auto_show = true,
        window = {
          border = vim.g.border_style,
        },
      },


      signature = { enabled = true }
    },
  },
}
