# ZSH path
ZSH="$HOME/.oh-my-zsh"

# Styling
ZSH_THEME="robbyrussell" # af-magic

# Custom aliases
source $HOME/.zsh/aliases

# Plugins
# plugins=(git)

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
# echo_color "\033[0;30m" "C-f  Move forward"
# echo_color "\033[0;30m" "C-b  Move backward"
# echo_color "\033[0;30m" "C-p  Move up"
# echo_color "\033[0;30m" "C-n  Move down"
# echo_color "\033[0;30m" "C-a  Beginning of line"
# echo_color "\033[0;30m" "C-e  End of line"
# echo_color "\033[0;30m" "C-d  Delete forward"
# echo_color "\033[0;30m" "C-h  Delete backwards"
# echo_color "\033[0;30m" "C-k  Delete forward whole line"
