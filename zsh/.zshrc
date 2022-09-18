
# alias
alias ls="exa"
alias la="exa -a"
alias ll="exa -la"
alias tree="exa --tree"
alias cat="bat"
alias "nomal-cat"="/usr/bin/cat"
alias clr="clear"
alias chwall="feh --bg-fill --randomize ~/Picture/wallpaper/*.{jpeg,png}"
alias ga="git add"
alias gs="git status"
alias gc="git commit"
alias gg="git graph"
alias gp="git push"
alias gch="git checkout"

# yarn control
alias yf="yarn format"
alias yl="yarn lint"

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



#export NVM_DIR="$HOME/.config/nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Created by newuser for 5.8
autoload -U compinit
compinit
