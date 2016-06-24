# ZSH path
ZSH=$HOME/.oh-my-zsh

# Styling
ZSH_THEME="af-magic"

# Custom aliases
source $HOME/.zsh/aliases

# Plugins
plugins=(git)

# Paths
source $ZSH/oh-my-zsh.sh

# Android SDK
export ANDROID_HOME=/usr/local/opt/android-sdk
export ANDROID_NDK=/usr/local/opt/android-ndk

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Go
export GOPATH="$HOME/Code"
export PATH="$PATH:$GOPATH/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Postgres
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"

# rbenv
eval "$(rbenv init -)"

# Autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
