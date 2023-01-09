--- keybind settings
local keymap = vim.keymap.set
keymap("", "<Space>", "<Nop>", {noremap = true, silent = true})
vim.g.mapleader = " "
vim.g.maplocalleader = " "


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

-- keymap("n", "K",  "<cmd>lua vim.lsp.buf.hover()<CR>")
keymap("n", "<leader>g", "<cmd>lua vim.lsp.buf.formatting()<CR>")
-- keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
-- keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
-- keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
-- keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
-- keymap("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
-- keymap("n", "gn", "<cmd>lua vim.lsp.buf.rename()<CR>")
-- keymap("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
-- keymap("n", "ge", "<cmd>lua vim.diagnostic.open_float()<CR>")
-- keymap("n", "g]", "<cmd>lua vim.diagnostic.goto_next()<CR>")
-- keymap("n", "g[", "<cmd>lua vim.diagnostic.goto_prev()<CR>")

--- lspsaga

-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", {silent = true})

-- Code action
keymap({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })

-- Rename
keymap("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })

-- Peek Definition
-- you can edit the definition file in this flaotwindow
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack C-t jump back
keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })

-- Show line diagnostics
keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

-- Show cursor diagnostics
keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })

-- Diagnostic jump can use `<c-o>` to jump back
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

-- Only jump to error
keymap("n", "[E", function()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
keymap("n", "]E", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })

-- Outline
keymap("n","<leader>o", "<cmd>LSoutlineToggle<CR>",{ silent = true })

-- Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

-- Float terminal
keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })
-- if you want to pass some cli command into a terminal you can do it like this
-- open lazygit in lspsaga float terminal
keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm lazygit<CR>", { silent = true })
-- close floaterm
keymap("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })


