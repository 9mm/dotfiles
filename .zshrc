# ZSH path
ZSH=$HOME/.oh-my-zsh

# Styling
ZSH_THEME="af-magic"

# Custom aliases
source $HOME/.zsh/aliases

# Plugins
#plugins=(git)

# Paths
source $ZSH/oh-my-zsh.sh

# Load SSH keys after reboot
ssh-add -A 2>/dev/null

# Brew
export PATH="/usr/local/bin:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Android
export PATH="~/Library/Android/sdk/tools:$PATH"
export PATH="~/Library/Android/sdk/platform-tools:$PATH"

# Go
export GOPATH="$HOME/Code"
export PATH="$GOPATH:$GOPATH/bin:$PATH"

# Postgres
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"

# rbenv
eval "$(rbenv init -)"

# Autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh  ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
