--- hilight settings
local opt = vim.opt
--- Reference highlight
opt.updatetime = 500
vim.cmd [[
highlight LspReferenceText  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceRead  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceWrite cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040

" augroup lsp_document_highlight
"   autocmd!
"   autocmd CursorHold,CursorHoldI * lua vim.lsp.buf.document_highlight()
"   autocmd CursorMoved,CursorMovedI * lua vim.lsp.buf.clear_references()
" augroup END

]]
