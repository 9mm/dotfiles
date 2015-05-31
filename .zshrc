# zsh path
ZSH=$HOME/.oh-my-zsh

# styling 
ZSH_THEME="af-magic"

# custom aliases
source $HOME/.zsh/aliases

# plugins 
plugins=(git)

# autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# paths
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

source $ZSH/oh-my-zsh.sh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
