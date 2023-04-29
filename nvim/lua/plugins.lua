-- plugins.lua
vim.cmd("packadd packer.nvim") require("packer").startup(function(use)
   -- manage itself
   use {"wbthomason/packer.nvim", opt = true} 


   --- LSP
   use {
      -- Configuration for Nvim LSP
      "neovim/nvim-lspconfig",
      -- LSP manager
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
   }
   -- complate engine
   use {
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/vim-vsnip",
      {"petertriho/cmp-git", requires = "nvim-lua/plenary.nvim"}
   }
   -- improve default vim.ui interface
   use "stevearc/dressing.nvim"

   -- pictgrams
   use "onsails/lspkind.nvim"

   -- nvim-lsp progress pop up
   use "j-hui/fidget.nvim"

   -- window resizer
   use "simeji/winresizer"
   
   -- memo
   use {"glidenote/memolist.vim"}


   -- filer
   use "tamago324/lir.nvim"
   use "nvim-lua/plenary.nvim"
   use "nvim-tree/nvim-web-devicons"

   -- telescope
   use "nvim-telescope/telescope.nvim"

   -- tree-sitter
	use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdateSync"}

   -- colorscheme
   use "4513ECHO/vim-colors-hatsunemiku"


end)
