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

keymap("n", "<leader>g",'<cmd>lua vim.lsp.buf.format()<CR>')
keymap('n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>')
keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
keymap('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
keymap('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>')
keymap('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
keymap('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
keymap('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
keymap('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>')

-- telescope
local builtin = require('telescope.builtin')
keymap("n", "<leader>ff", builtin.find_files, {})
keymap("n", "<leader>fg", builtin.live_grep, {})
keymap("n", "<leader>fb", builtin.buffers, {})
keymap("n", "<leader>fh", builtin.help_tags, {})
