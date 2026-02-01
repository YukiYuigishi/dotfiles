--- keybind settings
local keymap = vim.keymap.set
keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
keymap({ 'n', 'x' }, '<Space>', '<Nop>')
keymap({ 'n', 'x' }, '<Plug>(lsp)', '<Nop>')
keymap({ 'n', 'x' }, 'm', '<Plug>(lsp)')
keymap({ 'n', 'x' }, '<Plug>(ff)', '<Nop>')
keymap({ 'n', 'x' }, ';', '<Plug>(ff)')

--- <ESC>
keymap("i", "jj", "<ESC>")
keymap('t', '<Esc><Esc>', [[<C-\><C-n>]])

--- auto compliment (,{, [
keymap("i", "(", "()<LEFT>")
keymap("i", "{", "{}<LEFT>")
keymap("i", "[", "[]<LEFT>")

--- cancel search highlight
keymap("n", "<Esc><Esc>", "<cmd>nohlsearch<CR>")

-- open init.lua
keymap("n", "<F2>", "<cmd>tabnew<CR><cmd>edit ~/.config/nvim<CR>")
-- 2. build-in LSP function

-- keyboard shortcut

keymap('n', '<leader>g', '<cmd>lua vim.lsp.buf.format({focusable=false})<CR>')
keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
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
keymap('n', '<Esc><Esc>', '<cmd>cclose<CR>', { buffer=true, silent=true })

-- telescope
local builtin = require('telescope.builtin')
keymap("n", "<leader>ff", builtin.find_files, {})
keymap("n", "<leader>fg", builtin.live_grep, {})
keymap("n", "<leader>fb", builtin.buffers, {})
keymap("n", "<leader>fh", builtin.help_tags, {})

local POSTS_DIR = vim.fn.expand("~/.config/memo/_posts")
keymap("n", "<leader>fr", function()
    local dir = POSTS_DIR
    builtin.find_files({
        prompt_title = "Find Files: _posts",
        cwd = POSTS_DIR,
        hidden = true,
    })
end, {})
keymap("n", "<leader>fe", function()
    local dir = POSTS_DIR
    builtin.live_grep({
        prompt_title = "Live Grep: posts",
        search_dirs = { dir },
    })
end, {})
