# ZSH path
ZSH="$HOME/.oh-my-zsh"

# Styling
ZSH_THEME="robbyrussell"

# By default, zsh considers many characters part of a word (e.g., _ and -).
# Narrow that down to allow easier skipping through words via M-f and M-b.
export WORDCHARS='*?[]~&;!$%^<>'

# History config
export HISTSIZE=1000000
export SAVEHIST=$HISTSIZE
export HISTFILE="$HOME/.history"

# Custom includes
source $HOME/.zsh/aliases
source $HOME/.zsh/credentials

# Plugins
plugins=(zsh-autosuggestions)

# Load ZSH
source $ZSH/oh-my-zsh.sh

# Load SSH keys after reboot
# ssh-add ~/.ssh/id_ed25519 2>/dev/null
# ssh-add ~/.ssh/id_rsa 2>/dev/null

# Brew
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Postgres
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

# Ruby
eval "$(rbenv init -)"

# Yarn
export PATH="$HOME/.yarn/bin:$PATH"

# Elixir
export ERL_AFLAGS="-kernel shell_history enabled"

# Go
export GOPATH="$HOME/.go"
export PATH="$GOPATH:$GOPATH/bin:$PATH"

# Google Cloud SDK [brew install --cask google-cloud-sdk]
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

# Autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh  ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# Pet
# https://github.com/knqyf263/pet
function prev() {
  PREV=$(fc -lrn | head -n 1)
  sh -c "pet new `printf %q "$PREV"`"
}

# mkcd
function mkcd() {
  mkdir -p "$@" && cd "$@";
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
