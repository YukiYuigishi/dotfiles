return {
   {
      "neovim/nvim-lspconfig",
      event = { 'BufReadPre', 'BufNewFile' },
      config = function()
         vim.lsp.config('*', {
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
         })
      end,
   },
   {
      "mason-org/mason.nvim",
      cmd = "Mason",
      build = ":MasonUpdate",
      config = function()
         require("mason").setup({
            ui = {
               icons = {
                  package_installed = "✓",
                  package_pending = "➜",
                  package_uninstalled = "✗",
               }
            }
         })
      end,
   },
   {
      "mason-org/mason-lspconfig.nvim",
      opts = {},
      dependencies = {
         { "mason-org/mason.nvim", opts = {} },
         "neovim/nvim-lspconfig",
      },
      config = true,
   },
   {
         "j-hui/fidget.nvim",
            -- LSP handlers
   --         vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
   --            vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
   --         )
   
   },
}
