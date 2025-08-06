return {
   "nvim-treesitter/nvim-treesitter",
   build = ":TSUpdateSync",
   lazy = false,
   main = 'nvim-treesitter.configs',
   opts = {
      highlight = { enable = true },
   },
   --   opts = {
   --      ensure_installed = {
   --         "c",
   --         "cpp",
   --         "go",
   --         "typescript",
   --         "rust",
   --         "markdown",
   --         "lua",
   --         "vim",
   --         "toml",
   --         "yaml",
   --         "html",
   --         "css",
   --         "make",
   --         --	   "markdown",
   --         "json"
   --      },
   --
   --      sync_install = false,
   --      auto_install = true,
   --
   --
   --      highlight = {
   --         enable = true,
   --
   --         disable = function(lang, buf)
   --            local max_filesize = 100 * 1024    -- 100 KB
   --            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
   --            if ok and stats and stats.size > max_filesize then
   --               return true
   --            end
   --         end,
   --
   --         additional_vim_regex_highlighting = false,
   --      },
   --      indent = { enable = true },
   --   },
   --   config = function(_, opts)
   --      require('nvim-treesitter.configs').setup(opts)
   --   end,
}
