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
require('mason-lspconfig').setup_handlers({function(server)
   local opt = {
      capabilities = require('cmp_nvim_lsp').default_capabilities(
         vim.lsp.protocol.make_client_capabilities()
      )
   }
   require('lspconfig')[server].setup(opt)
end })

-- LSP handlers
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
)

--  snippet complete
local cmp = require('cmp')
cmp.setup({
   snippet = {
      expand = function(args)
         vim.fn["vsnip#anonymous"](args.body)
      end,
   },
   mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
   }),
   sources = cmp.config.sources({
      {name = 'nvim_lsp'},
      {name = 'vsnip'},
   },{
      {name = 'buffer'}
   })
})
-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
   sources = cmp.config.sources({
      { name = 'cmp_git' }, 
   }, {
      { name = 'buffer' },
   })
})

cmp.setup.cmdline({ '/', '?' }, {
   mapping = cmp.mapping.preset.cmdline(),
   sources = {
      { name = 'buffer' }
   }
})

cmp.setup.cmdline(':', {
   mapping = cmp.mapping.preset.cmdline(),
   sources = cmp.config.sources({
      { name = 'path' }
   }, {
      { name = 'cmdline' }
   })
})

-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
--  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
--  require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--    capabilities = capabilities
--  }

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
  devicons = {
   enable = true,
   highlight_dirname = true
  },
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
require('nvim-web-devicons').set_icon({
  lir_folder_icon = {
    icon = "",
    color = "#7ebae4",
    name = "LirFolderNode"
  }
})

vim.cmd("\
let g:memolist_path = '/home/yuki-arch/.config/memo/_posts'\
")


-- nvim-treesitter
require('nvim-treesitter.configs').setup{
   -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "cpp","go", "typescript","rust","markdown","lua", "vim", "help", "query" },

  sync_install = false,

  auto_install = true,


  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
