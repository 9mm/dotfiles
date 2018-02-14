# ZSH path
ZSH="$HOME/.oh-my-zsh"

# Styling
ZSH_THEME="robbyrussell" # af-magic

# By default, zsh considers many characters part of a word (e.g., _ and -).
# Narrow that down to allow easier skipping through words via M-f and M-b.
export WORDCHARS='*?[]~&;!$%^<>'

# Tweak history
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE
export HISTFILE="$HOME/.history"

# Custom aliases
source $HOME/.zsh/aliases

# Plugins
plugins=(zsh-autosuggestions)

# Load ZSH
source $ZSH/oh-my-zsh.sh

# Load SSH keys after reboot
ssh-add ~/.ssh/id_rsa 2>/dev/null
ssh-add ssh-add ~/.ssh/ops-lifebuzz-prod.pem 2>/dev/null

# Brew
export PATH="/usr/local/bin:$PATH"

# Yarn
export PATH="$HOME/.yarn/bin:$PATH"

# Elixir
export ERL_AFLAGS="-kernel shell_history enabled"

# Postgres
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

# Go (1.7.1 explicit)
# This is a non-brew version of Go 1.7.1 installed directly from compiled binaries
# on Golang homepage. This is because installing specific versions of 1.7.1 with Homebrew
# is challenging, and this is required for LifeBuzz stack-proxy. Once LifeBuzz is sold
# we can...
#   1. remove the single `export PATH="/usr/local/go/bin:$PATH"` below this comment
#   2. delete the entire /usr/local/go folder
#   3. reinstall Go from brew
export PATH="/usr/local/go/bin:$PATH"

# Go
export GOPATH="$HOME/.go"
export PATH="$GOPATH:$GOPATH/bin:$PATH"

# Android
export PATH="$HOME/Library/Android/sdk/tools:$PATH"
export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"

# Rbenv
eval "$(rbenv init -)"

# Autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh  ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# Pet
# https://github.com/knqyf263/pet
function prev() {
  PREV=$(fc -lrn | head -n 1)
  sh -c "pet new `printf %q "$PREV"`"
}

# MOTD
function echo_color() {
  local color="$1"
  printf "${color}$2\033[0m\n"
}
# echo_color "\033[0;90m" "c-f  Move forward"
# echo_color "\033[0;90m" "c-b  Move backward"
# echo_color "\033[0;90m" "c-p  Move up"
# echo_color "\033[0;90m" "c-n  Move down"
# echo_color "\033[0;90m" "c-a  Jump to beginning of line"
# echo_color "\033[0;90m" "c-e  Jump to end of line"
# echo_color "\033[0;90m" "c-d  Delete forward"
# echo_color "\033[0;90m" "c-h  Delete backward"
# echo_color "\033[0;90m" "c-k  Delete forward to end of line"
# echo_color "\033[0;90m" "c-u  Delete entire line"
