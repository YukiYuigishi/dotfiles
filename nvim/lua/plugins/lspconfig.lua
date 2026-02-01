return {
   {
      "neovim/nvim-lspconfig",
      event = { 'BufReadPre', 'BufNewFile' },
--      config = function()
--         vim.lsp.config('*', {
--            capabilities = require('cmp_nvim_lsp').default_capabilities(),
--         })
--      end,
      config = function()
         local capabilities = require('cmp_nvim_lsp').default_capabilities()

       
         -- 全サーバー共通の on_attach
         local on_attach = function(client, buffer)
            pcall(vim.api.nvim_clear_autocmds, { group = "LspDocumentHighlight", buffer = bufnr})

            -- documentHighlight に対応しているときだけ設定
            if client:supports_method("textDocument/documentHighlight") then
               local grp = vim.api.nvim_create_augroup("LspDocumentHighlight", {clear = false}) 
               vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" },{
                  group = grp,
                  buffer = bufnr,
                  callback = vim.lsp.buf.document_highlight,
               })
               vim.api.nvim_create_autocmd("CursorMoved", {
                  group = grpc,
                  buffer = bufnr,
                  callback = vim.lsp.buf.clear_references,
               })
            end
         end

         vim.lsp.config("*", {
            capabilities = capabilities,
            on_attach = on_attach,
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
