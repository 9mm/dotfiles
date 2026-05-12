eval "$(/opt/homebrew/bin/brew shellenv)"

# https://stackoverflow.com/a/71271754/794481
export ZSH_COMPDUMP="$ZSH/cache/.zcompdump-$HOST"

# Custom scripts
export PATH="$HOME/.zsh/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Custom includes
source "$HOME/.zsh/aliases"
source "$HOME/.zsh/credentials"

# Ripgrep
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# Postgres
export PATH="/Applications/Postgres.app/Contents/Versions/17/bin:$PATH"

# Ruby
eval "$(rbenv init - zsh)"

# Rust
source "$HOME/.cargo/env"

# Q
export QHOME="$HOME/.q"
export PATH="$QHOME/m64:$PATH"

# Go
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"

# Node
eval "$(fnm env --use-on-cd --resolve-engines --shell zsh --log-level error)"

# PNPM
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end

# fix Typhoeus crashing - https://github.com/rails/rails/issues/38560
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY="YES"
