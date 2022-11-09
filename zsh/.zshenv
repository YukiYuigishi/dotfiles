export PATH="$PATH:/usr/local/bin/nvim/bin"
export PATH="$PATH:~/.local/bin/arduino/arduino-ide_2.0.0_Linux_64bit"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH=$PATH:~/.platformio/penv/bin
export TERMINAL=alacritty
export GPG_TTY=$(tty)
export XDG_CONFIG_HOME="${HOME}/.config"
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=10000
export BR2_DL_DIR=~/.buildroot/download
export WINIT_X11_SCALE_FACTOR=1.66


export GNUPGHOME=${HOME}/.gnupg
# This loads nvm
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. "$HOME/.cargo/env"

# alias
alias chrome="google-chrome-stable"
