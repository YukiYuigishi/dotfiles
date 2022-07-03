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
alias clr="clear"
alias chwall="feh --bg-fill --randomize ~/Picture/wallpaper/*.{jpeg,png}"
alias gs="git status -bs"
alias i3-doc="chrome ~/.cache/i3-wm-doc/i3_\ i3\ User’s\ Guide.html &"
alias n="nvim"


# history
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY

# function
function history-all { history -E 1 }

# prompt
PROMPT='%m:%F{green}%~%f %n$ '


