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

opt.termguicolors = true
opt.showmatch = true
opt.matchtime = 1

--- tab

opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.smarttab = true
opt.autoindent = true
vim.g.editorconfig_enable = true

--- LSP handlers
vim.diagnostic.config({
  virtual_text = false,
})

--- set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

