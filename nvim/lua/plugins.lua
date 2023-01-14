-- plugins.lua
vim.cmd("packadd packer.nvim") require("packer").startup(function(use)
   -- manage itself
   use {"wbthomason/packer.nvim", opt = true} 
   -- Configuration for Nvim LSP
   use "neovim/nvim-lspconfig" 
   -- LSP Manager
   use "williamboman/mason.nvim"  
   -- mason-config
	use "williamboman/mason-lspconfig.nvim"
   -- formatting support
   use "jose-elias-alvarez/null-ls.nvim"
   use "jayp0521/mason-null-ls.nvim"



   -- nvim-cmp
	use "hrsh7th/nvim-cmp" 
	use "hrsh7th/cmp-nvim-lsp"
   use "hrsh7th/cmp-buffer" 
   use "hrsh7th/cmp-path"  
   use "hrsh7th/cmp-cmdline"

   use "hrsh7th/vim-vsnip"

   -- LSP UI
   use({
      "glepnir/lspsaga.nvim",
      branch = "main",
   })

   --- signature support
   use "ray-x/lsp_signature.nvim"

   --- improve default vim.ui interface
   use "stevearc/dressing.nvim"

   --- pictgrams
   use "onsails/lspkind.nvim"

   -- nvim-lsp progress pop up
   use "j-hui/fidget.nvim"

   -- window resizer
   use "simeji/winresizer"


   -- filer
   use "tamago324/lir.nvim"
   use "nvim-lua/plenary.nvim"
   use "kyazdani42/nvim-web-devicons"

   -- telescope
   use "nvim-lua/telescope.nvim"

   -- tree-sitter
	use "nvim-treesitter/nvim-treesitter"

   -- colorscheme
   use "4513ECHO/vim-colors-hatsunemiku"


end)
