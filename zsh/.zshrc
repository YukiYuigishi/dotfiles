# Created by newuser for 5.8
autoload -U compinit
compinit

# alias
alias ls="exa"
alias la="exa -a"
alias ll="exa -la"
alias tree="exa --tree"
alias cat="bat"
alias "nomal-cat"="/usr/bin/cat"
alias chwall="feh --bg-fill --randomize ~/Picture/wallpaper/*.{jpeg,png}"
alias gs="git status -bs"

# history
setopt hist_ignore_dups
setopt EXTENDED_HISTORY
