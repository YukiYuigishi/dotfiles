"文字コードをutf-8
se fenc=utf-8
"ヤンクをクリップボードに保存
se clipboard=unnamedplus
"mouse 使用
""se mouse=a
"jj back
inoremap <silent> jj <ESC>

"行番号を表示
se number
"help 日本語化
se helplang=ja
"音殺す
se belloff=all
"色系
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"コメントの色変更
highlight Comment ctermfg=LightBlue
"文字列の色を変えたい
highlight String ctermfg=LightCyan
"数字の色を変える
highlight Number ctermfg=DarkCyan
"検索した文字列をハイライトする
se hls
" ノーマルアイテム
"hi Pmenu ctermbg=0
" 選択しているアイテム
"hi PmenuSel ctermbg=4
" スクロールバー
hi PmenuSbar ctermbg=2
" スクロールのレバー
hi PmenuThumb ctermfg=3

" floating window
hi NormalFloat guifg=#2e3440 guibg=#a3be8c
"入力補助
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ペア括弧を表示する
se showmatch
se expandtab
"backup swap 移動
se backup
se swapfile
se undofile
se updatetime=30000
se backupdir=$HOME/.vim/backup
se undodir=$HOME/.vim/undo
se directory=$HOME/.vim/temp
" タブ文字の表示幅
se tabstop=3
" Vimが挿入するインデントの幅
se shiftwidth=3
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
se smarttab
" 改行時に前の行のインデントを継続する
se autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
se smartindent
"括弧補完
inoremap { {}<LEFT>
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
" Turn off paste mode when leaving insert ノーマルモードになったらpaste modeを解除する
autocmd InsertLeave * se nopaste
"ファイル名を表示
se title
"F2でvimrc
nnoremap <silent> <F2> :tabnew $MYVIMRC<CR>

" File type detection is On.
se splitright
filetype plugin indent on
"syntax enable

runtime init/dein.init.vim

" key map系
let mapleader = "\<Space>"
nnoremap <silent><Leader>w :w<CR>
nnoremap <silent><Leader>q :wq<CR><CR>

"矢印禁止
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
" インデント変更
vnoremap < <gv
vnoremap > >gv

" 不可視文字関連
" 全角スペース
scriptencoding utf-8
aug highlightIdegraphSpace
   au!
   au ColorScheme * highlight  IdeographhicSpace term=underline ctermbg=DarkRed
   au VimEnter,WinEnter * match IdeographhicSpace /　/
aug end
colorscheme default
" 半角スペース 
se list listchars=tab:>-,trail:_
"仮の設定"
"coc.nvim
" if hidden is not se, TextEdit might fail.
se hidden

" Better display for messages
se cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
se updatetime=300
" don't give |ins-completion-menu| messages.
se shortmess+=c
" always show signcolumns
se signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" quick fix
command! -nargs=* -range CocFix    :call CocActionAsync('codeActionRange', <line1>, <line2>, 'quickfix')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
se stl^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Format 
nmap <silent> <leader>g :Format<cr>
" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"明度設定
se pumblend=10


se laststatus=2
se mouse=a

let g:saved_memo_path='$HOME/memo'
let g:memo_saved_dir='$HOME/memo'

"追記
aug HTMLANDXML
   autocmd!
   autocmd FileType xml inoremap <buffer> </ </<C-x><C-o>
   autocmd FileType html inoremap <buffer> </ </<C-x><C-o>
aug END
" tmux のESC delay 対策
se ttimeoutlen=10

" ファイル名表示
se stl=%F
" 変更チェック表示
se stl+=%m
" 読み込み専用かどうか表示
se stl+=%r
" ヘルプページなら[HELP]と表示
se stl+=%h
" プレビューウインドウなら[Prevew]と表示
se stl+=%w
" これ以降は右寄せ表示
se stl+=%=
" file encoding
se stl+=[ENC=%{&fileencoding}]
" 現在行数/全行数
se stl+=[LOW=%l/%L]
" ステータスラインを常に表示(0:表示しない、1:2つ以上ウィンドウがある時だけ表示)
se laststatus=2

" tsx
au BufNewFile,BufRead *.tsx let b:tsx_ext_found = 1
au BufNewFile,BufRead *.tsx set filetype=typescript.tsx
au FileType json syntax match Comment +\/\/.\+$+


set list listchars=tab:>-,trail:_
scriptencoding utf-8

augroup highlightIdegraphicSpace
   autocmd!
   autocmd ColorScheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen
   autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END

colorscheme pablo
