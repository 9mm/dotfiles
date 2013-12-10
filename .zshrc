ZSH=$HOME/.oh-my-zsh

# Also good: sorin
ZSH_THEME="af-magic"

# Custom aliases
source $HOME/.zsh/aliases

# ~/.oh-my-zsh/plugins/
# plugins=(git github osx)
plugins=(git)

source $ZSH/oh-my-zsh.sh

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

export PATH=/Users/Zesty/.rvm/gems/ruby-head/bin:/Users/Zesty/.rvm/gems/ruby-head@global/bin:/Users/Zesty/.rvm/rubies/ruby-head/bin:/Users/Zesty/.rvm/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH
