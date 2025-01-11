# ZSH
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="robbyrussell"

# Easier skipping through words via M-f and M-b
export WORDCHARS="*?[]~&;!$%^<>"

# OMZ
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 14

plugins=(zsh-autosuggestions)

source "$ZSH/oh-my-zsh.sh"

# Homebrew
export HOMEBREW_NO_ENV_HINTS=true

# History
export HISTSIZE=1000000
export SAVEHIST=$HISTSIZE
export HISTFILE="$HOME/.history"

# Load SSH keys
# ssh-add ~/.ssh/id_ed25519 2>/dev/null
# ssh-add ~/.ssh/id_rsa 2>/dev/null

# Zoxide
eval "$(zoxide init --cmd j zsh)"

# Neovide.app
# Instead of using launchd properly, just put them here so we don't forget
launchctl setenv NEOVIDE_FRAME "buttonless"
launchctl setenv NEOVIDE_TITLE_HIDDEN "true"
launchctl setenv NEOVIDE_VSYNC "0"
launchctl setenv NEOVIDE_FORK "0"

neovide_bundle() {
  cd ~/Code/neovide \
    && cargo install --path . \
    && rm -rf ~/Code/neovide/target/aarch64-apple-darwin \
    && rm -rf ~/.cargo/bin/Neovide.app \
    && GENERATE_BUNDLE_APP=true GENERATE_DMG=true ./macos-builder/run aarch64-apple-darwin \
    && mv ~/Code/neovide/target/aarch64-apple-darwin/release/bundle/osx/Neovide.app ~/.cargo/bin/ \
    && open ~/.cargo/bin/
}

# Pet
function prev() {
  PREV=$(fc -lrn | head -n 1)
  sh -c "pet new `printf %q "$PREV"`"
}
