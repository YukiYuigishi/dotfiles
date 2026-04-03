return {
   "nvim-treesitter/nvim-treesitter",
   build = ":TSUpdate",
   lazy = false,
   config = function()
      require("nvim-treesitter").setup({
	 ensure_installed = { "lua", "c", "go"},
      })
   end,
}
