"<----------dein.vim-------------------------------->

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
   call dein#begin('~/.cache/dein')
   call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
   call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
   call dein#end()
   call dein#save_state()
endif
"<---          installation check                --->
"if dein#check_install()
"   call dein#install()
"endif

"""<---          remove check                      --->
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif
