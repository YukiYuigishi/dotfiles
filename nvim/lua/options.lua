-- plugin options
--  LSP Sever management
require("mason").setup({
   ui = {
      icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
      }
   }
})

require("mason-lspconfig").setup_handlers({ function(server)
  local opt = {
    -- -- Function executed when the LSP server startup
    -- on_attach = function(client, bufnr)
    --   local opts = { noremap=true, silent=true }
    --   vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    --   vim.cmd "autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)"
    -- end,
    capabilities = require("cmp_nvim_lsp").default_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    )
  }
  require("lspconfig")[server].setup(opt)
end })


local cmp = require("cmp")
cmp.setup({ 
   snippet = {
      expand = function(args)
         vim.fn["vsnip#anonymous"](args.body)
      end,
   },
   mapping = cmp.mapping.preset.insert({
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-l>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<CR>" ] = cmp.mapping.confirm { select = true},
   }),
   sources = {
      { name = "nvim_lsp"},
      { name = "buffer"},
      { name = "path"}
   },
   experimental = {
      ghost_text = true,
   },

})

cmp.setup.cmdline("/", {
   mapping = cmp.mapping.preset.cmdline(),
   sources = {
      { name = "buffer" }
   }
})

cmp.setup.cmdline(":", {
   mapping = cmp.mapping.preset.cmdline(),
   sources = {
      { name = "path" },
      { name = "cmdlime" }
   },
})


-- LSP UI
require("lspsaga").init_lsp_saga({
   
})


-- lir.nvim
local actions = require("lir.actions")
local mark_actions = require ("lir.mark.actions")
local clipboard_actions = require("lir.clipboard.actions")
-- disable netrw
vim.cmd("\
let g:loaded_netrw = 1\
let g:loaded_netrwPlugin = 1")
require('lir').setup {
  show_hidden_files = false,
  ignore = {}, -- { ".DS_Store" "node_modules" } etc.
  devicons_enable = true,
  mappings = {
    ["l"]     = actions.edit,
    ['<C-s>'] = actions.split,
    ['<C-v>'] = actions.vsplit,
    ['<C-t>'] = actions.tabedit,

    ['h']     = actions.up,
    ['q']     = actions.quit,

    ['K']     = actions.mkdir,
    ['N']     = actions.newfile,
    ['R']     = actions.rename,
    ['@']     = actions.cd,
    ['Y']     = actions.yank_path,
    ['.']     = actions.toggle_show_hidden,
    ['D']     = actions.delete,

    ['J'] = function()
      mark_actions.toggle_mark()
      vim.cmd('normal! j')
    end,
    ['C'] = clipboard_actions.copy,
    ['X'] = clipboard_actions.cut,
    ['P'] = clipboard_actions.paste,
  },
  float = {
    winblend = 0,
    curdir_window = {
      enable = false,
      highlight_dirname = false
    },

    -- -- You can define a function that returns a table to be passed as the third
    -- -- argument of nvim_open_win().
    -- win_opts = function()
    --   local width = math.floor(vim.o.columns * 0.8)
    --   local height = math.floor(vim.o.lines * 0.8)
    --   return {
    --     border = {
    --       "+", "─", "+", "│", "+", "─", "+", "│",
    --     },
    --     width = width,
    --     height = height,
    --     row = 1,
    --     col = math.floor((vim.o.columns - width) / 2),
    --   }
    -- end,
  },
  hide_cursor = true,
  on_init = function()
    -- use visual mode
    vim.api.nvim_buf_set_keymap(
      0,
      "x",
      "J",
      ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
      { noremap = true, silent = true }
    )

    -- echo cwd
    vim.api.nvim_echo({ { vim.fn.expand("%:p"), "Normal" } }, false, {})
  end,
}

-- custom folder icon
require'nvim-web-devicons'.set_icon({
  lir_folder_icon = {
    icon = "",
    color = "#7ebae4",
    name = "LirFolderNode"
  }
})

