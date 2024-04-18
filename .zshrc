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
export PATH="$PATH:$HOME/.local/bin"

# Neovide exports
# Instead of using launchd properly, just put them here so we don't forget
launchctl setenv NEOVIDE_FRAME "buttonless"
launchctl setenv NEOVIDE_TITLE_HIDDEN "true"
launchctl setenv NEOVIDE_VSYNC "0"
launchctl setenv NEOVIDE_FORK "0"

# Postgres
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/16/bin"

# Ruby
# eval "$(rbenv init - zsh --no-rehash)"
eval "$(rbenv init - zsh)"

# fix Typhoeus crashing - https://github.com/rails/rails/issues/38560
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# NVM - preventing slow startup with https://github.com/lukechilds/zsh-nvm
export NVM_DIR="$HOME/.nvm"
export NVM_LAZY_LOAD=true
# export NVM_COMPLETION=true
# if you receive 'env: node: Not a directory' using a global pnpm package, it must be added here
export NVM_LAZY_LOAD_EXTRA_COMMANDS=('create-vue' 'eslint' 'mvim' 'n' 'npm' 'nvim' 'pnpm' 'rollup' 'v' 'wrangler' 'yarn')

# PNPM
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Go
export GOPATH="$HOME/.go"
export PATH="$PATH:$GOPATH/bin"

# Elixir
export ERL_AFLAGS="-kernel shell_history enabled"

# Ripgrep
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

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
