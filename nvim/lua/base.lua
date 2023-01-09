vim.cmd("autocmd!")
local opt = vim.opt

--- line number

opt.number = true
opt.relativenumber = true

--- searching settings

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true
opt.inccommand = "split"
opt.wrapscan = true

--- hilight branket

opt.showmatch = true
opt.matchtime = 1

--- tab

opt.expandtab = true
opt.tabstop = 3
opt.shiftwidth = 3
opt.smarttab = true
opt.autoindent = true


--- LSP handlers
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
   vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false}
)

--- 



