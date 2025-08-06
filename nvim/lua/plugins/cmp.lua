return {
      "hrsh7th/nvim-cmp",
      dependencies = {
         "hrsh7th/cmp-nvim-lsp",
         "hrsh7th/cmp-buffer",
         "hrsh7th/cmp-path",
         "hrsh7th/cmp-cmdline",
         "hrsh7th/vim-vsnip",
         "petertriho/cmp-git", 
         "nvim-lua/plenary.nvim",
         "onsails/lspkind.nvim"
      },

      config = function()
         --  snippet complete
         local cmp = require('cmp')
         cmp.setup({
            snippet = {
               expand = function(args)
                  vim.fn["vsnip#anonymous"](args.body)
               end,
            },
            mapping = cmp.mapping.preset.insert({
               ['<C-b>'] = cmp.mapping.scroll_docs(-4),
               ['<C-f>'] = cmp.mapping.scroll_docs(4),
               ['<C-Space>'] = cmp.mapping.complete(),
               ['<C-e>'] = cmp.mapping.abort(),
               ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources({
               { name = 'nvim_lsp' },
               { name = 'vsnip' },
            }, {
               { name = 'buffer' }
            })
         })
         -- Set configuration for specific filetype.
         cmp.setup.filetype('gitcommit', {
            sources = cmp.config.sources({
               { name = 'cmp_git' },
            }, {
               { name = 'buffer' },
            })
         })

         cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
               { name = 'buffer' }
            }
         })

         cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
               { name = 'path' }
            }, {
               { name = 'cmdline' }
            })
         })
      end

}
