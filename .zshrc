# ZSH
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="robbyrussell"

# https://stackoverflow.com/a/71271754/794481
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

# Easier skipping through words via M-f and M-b
export WORDCHARS='*?[]~&;!$%^<>'

# OMZ
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 7

plugins=(zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Homebrew
export HOMEBREW_NO_ENV_HINTS=true

# History
export HISTSIZE=1000000
export SAVEHIST=$HISTSIZE
export HISTFILE="$HOME/.history"

# Custom scripts
export PATH="$HOME/.zsh/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Custom includes
source $HOME/.zsh/aliases
source $HOME/.zsh/credentials

# Load SSH keys
# ssh-add ~/.ssh/id_ed25519 2>/dev/null
# ssh-add ~/.ssh/id_rsa 2>/dev/null

# Neovide
# Instead of using launchd properly, just put them here so we don't forget
launchctl setenv NEOVIDE_FRAME "buttonless"
launchctl setenv NEOVIDE_TITLE_HIDDEN "true"
launchctl setenv NEOVIDE_VSYNC "0"
launchctl setenv NEOVIDE_FORK "0"

# Zoxide
eval "$(zoxide init --cmd j zsh)"

# Ripgrep
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# Postgres
export PATH="/Applications/Postgres.app/Contents/Versions/16/bin:$PATH"

# Ruby
eval "$(rbenv init - zsh)"

# Go
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"

# Node
export PATH="/opt/homebrew/opt/node@20/bin:$PATH"

# PNPM
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Pet
function prev() {
  PREV=$(fc -lrn | head -n 1)
  sh -c "pet new `printf %q "$PREV"`"
}

# fix Typhoeus crashing - https://github.com/rails/rails/issues/38560
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
