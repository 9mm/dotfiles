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

# https://stackoverflow.com/a/71271754/794481
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

# Homebrew
# loaded via .zprofile
export HOMEBREW_NO_ENV_HINTS=true

# Custom scripts
export PATH="$PATH:$HOME/.zsh/bin"

# Postgres
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"

# Ruby
# eval "$(rbenv init - zsh --no-rehash)"
eval "$(rbenv init - zsh)"

# fix Typhoeus crashing - https://github.com/rails/rails/issues/38560
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# NVM - preventing slow startup with https://github.com/lukechilds/zsh-nvm
export NVM_DIR="$HOME/.nvm"
export NVM_LAZY_LOAD=true
# export NVM_COMPLETION=true
# if you receive 'env: node: Not a directory' using a global yarn package, it must be added here
export NVM_LAZY_LOAD_EXTRA_COMMANDS=('create-vue' 'eslint' 'mvim' 'rollup' 'v' 'wrangler' 'yarn')

# Yarn
export PATH="$PATH:$HOME/.yarn/bin"

# Go
export GOPATH="$HOME/.go"
export PATH="$PATH:$GOPATH:$GOPATH/bin"

# Elixir
export ERL_AFLAGS="-kernel shell_history enabled"

# FZF
# ignore file comes from ~/.ignore
export FZF_DEFAULT_COMMAND="fd --type f"

# Zoxide
eval "$(zoxide init --cmd j zsh)"

# Pet - https://github.com/knqyf263/pet
function prev() {
  PREV=$(fc -lrn | head -n 1)
  sh -c "pet new `printf %q "$PREV"`"
}

# Custom includes
source $HOME/.zsh/aliases
source $HOME/.zsh/credentials

# Load SSH keys after reboot
# ssh-add ~/.ssh/id_ed25519 2>/dev/null
# ssh-add ~/.ssh/id_rsa 2>/dev/null

# Plugins
plugins=(zsh-autosuggestions zsh-nvm)

# Load ZSH
source $ZSH/oh-my-zsh.sh

# MOTD
# function echo_color() {
#   local color="$1"
#   printf "${color}$2\033[0m\n"
# }
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
