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

   -- nvim-cmp
	use "hrsh7th/nvim-cmp" 
	use "hrsh7th/cmp-nvim-lsp"
   use "hrsh7th/cmp-buffer" 
   use "hrsh7th/cmp-path"  
   use "hrsh7th/cmp-cmdline"

   use "hrsh7th/vim-vsnip"
	use "hrsh7th/vim-vsnip"

   -- LSP UI
   use({
      "glepnir/lspsaga.nvim",
      branch = "main",
   })

   -- window resizer
   use "simeji/winresizer"


   -- filer
   use "tamago324/lir.nvim"
   use "nvim-lua/plenary.nvim"
   use "kyazdani42/nvim-web-devicons"


   -- colorscheme
   use "4513ECHO/vim-colors-hatsunemiku"

end)
