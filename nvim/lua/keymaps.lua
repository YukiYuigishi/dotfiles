--- keybind settings
local keymap = vim.keymap.set
keymap("", "<Space>", "<Nop>", {noremap = true, silent = true})
vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap({ 'n', 'x' }, '<Space>', '<Nop>')
keymap({ 'n', 'x' }, '<Plug>(lsp)', '<Nop>')
keymap({ 'n', 'x' }, 'm', '<Plug>(lsp)')
keymap({ 'n', 'x' }, '<Plug>(ff)', '<Nop>')
keymap({ 'n', 'x' }, ';', '<Plug>(ff)')

--- jj <ESC>
keymap("i", "jj", "<ESC>")

--- auto compliment (,{, [
keymap("i", "(", "()<LEFT>")
keymap("i", "{", "{}<LEFT>")
keymap("i", "[", "[]<LEFT>")


-- open init.lua
keymap("n", "<F2>", "<cmd>tabnew<CR><cmd>edit ~/.config/nvim<CR>")
-- 2. build-in LSP function

-- keyboard shortcut


--- lspsaga
-- local function show_documentation()
--   local ft = vim.opt.filetype._value
--   if ft == 'vim' or ft == 'help' then
--     vim.cmd([[execute 'h ' . expand('<cword>') ]])
--   else
--     require('lspsaga.hover').render_hover_doc()
--   end
-- end

keymap("n", "<leader>g", "<cmd>lua vim.lsp.buf.formatting()<CR>")
-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
keymap("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", {silent = true})

-- Code action
keymap({"n","v"}, "ga", "<cmd>Lspsaga code_action<CR>", { silent = true })

-- Rename
keymap("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })

-- Peek Definition
-- you can edit the definition file in this flaotwindow
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack C-t jump back
keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })

-- Show line diagnostics
keymap("n", "<leader>e", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

-- Show cursor diagnostics
keymap("n", "<leader>e", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })

-- Diagnostic jump can use `<c-o>` to jump back
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

-- Only jump to error
--
keymap("n", "[E", function()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
keymap("n", "]E", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })

-- Outline
-- keymap("n","<leader>o", "<cmd>LSoutlineToggle<CR>",{ silent = true })

-- Hover Doc
-- keymap("n", "K", show_documentation , { silent = true })
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>" , { silent = true })

-- Float terminal
keymap("n", "<A-d>", "<cmd>Lspsaga term_toggle<CR>", { silent = true })
-- if you want to pass some cli command into a terminal you can do it like this
-- open lazygit in lspsaga float terminal
keymap("n", "<A-g>", "<cmd>Lspsaga term_toggle lazygit<CR>", { silent = true })
-- close floaterm
keymap("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })


-- telescope.nvim
keymap("n", "<Plug>(ff)r", "<Cmd>Telescope find_files<CR>")
keymap("n", "<Plug>(ff)s", "<Cmd>Telescope git_status<CR>")
keymap("n", "<Plug>(ff)b", "<Cmd>Telescope buffers<CR>")
keymap("n", "<Plug>(ff)f", "<Cmd>Telescope live_grep<CR>")
