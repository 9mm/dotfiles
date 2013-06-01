ZSH=$HOME/.oh-my-zsh
ZSH_THEME="sorin"

# Custom aliases
source $HOME/.zsh/aliases

# ~/.oh-my-zsh/plugins/
plugins=(bundler git github osx vi-mode)

source $ZSH/oh-my-zsh.sh

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

export PATH=/usr/local/bin:~/bin:$PATH:$HOME/usr/local/share/python:/.rvm/bin:/usr/local/mysql/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/git/bin
