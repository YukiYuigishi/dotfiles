-- autocmds.lua

local api = vim.api

-- vim.api.nvim_create_autocmd({ 'CursorHold' }, {
--   pattern = { '*' },
--   callback = function()
--     require('lspsaga.diagnostic').show_cursor_diagnostics()
--   end
-- })
--

-- api.nvim_create_autocmd({ 'FileType' }, {
--   pattern = { 'typescript', 'typescriptreact', 'typescript.tsx' },
--   callback = function()
--     vim.keymap.set({ 'n' }, '<Plug>(lsp)f', function()
-- vim.cmd([[EslintFixAll]])
--       vim.lsp.buf.format({ name = 'null-ls' })
--     end)
-- end,
-- })
