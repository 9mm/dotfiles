ZSH=$HOME/.oh-my-zsh

# Also good: sorin
ZSH_THEME="af-magic"

# Custom aliases
source $HOME/.zsh/aliases

# ~/.oh-my-zsh/plugins/
plugins=(git virtualenv)

source $ZSH/oh-my-zsh.sh

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
