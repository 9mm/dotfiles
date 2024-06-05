## 9mm .dotfiles

### Neovim + Neovide

<img src="https://raw.github.com/9mm/dotfiles/master/screenshots/home.png" width="100%" alt="Neovim + Neovide">

<div>
  <img src="https://raw.github.com/9mm/dotfiles/master/screenshots/mode-n.png" width="49%" alt="lualine.nvim">
  <img src="https://raw.github.com/9mm/dotfiles/master/screenshots/mode-i.png" width="49%" alt="lualine.nvim">
  <!-- <img src="https://raw.github.com/9mm/dotfiles/master/screenshots/mode-r.png" width="49%" alt="lualine.nvim"> -->
</div>
<div>
  <img src="https://raw.github.com/9mm/dotfiles/master/screenshots/ls.png" width="49%" alt="lazy.nvim">
  <img src="https://raw.github.com/9mm/dotfiles/master/screenshots/mm.png" width="49%" alt="mason.nvim">
</div>
<div>
  <img src="https://raw.github.com/9mm/dotfiles/master/screenshots/cmp.png" width="49%" alt="LSP + nvim-cmp">
  <img src="https://raw.github.com/9mm/dotfiles/master/screenshots/undo.png" width="49%" alt="undotree">
</div>
<div>
  <img src="https://raw.github.com/9mm/dotfiles/master/screenshots/cp.png" width="49%" alt="ccc.nvim">
  <img src="https://raw.github.com/9mm/dotfiles/master/screenshots/fe.png" width="49%" alt="mini.files">
</div>
<div>
  <img src="https://raw.github.com/9mm/dotfiles/master/screenshots/iterm.png" width="49%" alt="vim-floaterm + oh-my-zsh">
  <img src="https://raw.github.com/9mm/dotfiles/master/screenshots/iterm2.png" width="49%" alt="vim-floaterm + oh-my-zsh">
</div>
<div>
  <img src="https://raw.github.com/9mm/dotfiles/master/screenshots/lspc.png" width="49%" alt="lsp-config">
  <img src="https://raw.github.com/9mm/dotfiles/master/screenshots/lz.png" width="49%" alt="vim-floaterm + lazygit">
</div>
<div>
  <img src="https://raw.github.com/9mm/dotfiles/master/screenshots/lz2.png" width="49%" alt="vim-floaterm + lazygit">
  <img src="https://raw.github.com/9mm/dotfiles/master/screenshots/gg.png" width="49%" alt="telescope.nvim">
</div>
<div>
  <img src="https://raw.github.com/9mm/dotfiles/master/screenshots/q.png" width="49%" alt="telescope.nvim">
  <img src="https://raw.github.com/9mm/dotfiles/master/screenshots/telescope.png" width="49%" alt="telescope.nvim">
</div>
<div>
  <img src="https://raw.github.com/9mm/dotfiles/master/screenshots/ts.png" width="49%" alt="treesitter playground">
  <img src="https://raw.github.com/9mm/dotfiles/master/screenshots/cmp2.png" width="49%" alt="LSP + nvim-cmp">
</div>
<div>
  <img src="https://raw.github.com/9mm/dotfiles/master/screenshots/wk.png" width="49%" alt="which-key.nvim">
  <img src="https://raw.github.com/9mm/dotfiles/master/screenshots/car.png" width="49%" alt="cellular-automaton.nvim">
</div>

### Cool Features

* A Neovim/Vim config with full LSP support that I have refined for 10+ years
* Fullscreen overlay terminal with `<c-i>` (use iTerm3 `plist`)
* ZSH autocompletion with `<c-e>`
* Snippet storage via `pet list`. Type `prev` to store previous command
* Zoxide (previously autojump) to common directories with `j <partial name>`
* Lots of Mac optimizations

### Basic Setup

Set a super fast keyboard repeat

```bash
defaults write NSGlobalDomain KeyRepeat -int 1
```

If you're on a Mac, I recommend remapping your `Caps Lock` key to a `Control` key in keyboard settings.

### iTerm 3

Download and install [iTerm3](https://www.iterm2.com/downloads.html)

Install the [Dracula](https://draculatheme.com/iterm/) color scheme and activate it.

Open iTerm preferences, and choose `General > Preferences`. Check the box for
`load preferences from custom folder` and choose the `iTerm` folder which
includes `com.googlecode.iterm2.plist`. Before loading, you may want to change
`zesty` to your own home folder via find/replace.

### Oh-My-ZSH

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
```

### Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew analytics off
brew update
brew install make cmake git python zoxide ripgrep fzf fd curl wget tmux
brew install lazygit tmux jq tldr httpie htop diff-so-fancy
brew install saulpw/vd/visidata
brew install knqyf263/pet/pet
```

### Node

```bash
brew install pnpm node@20 # LTS
pnpm -g install neovim nuxi@latest wrangler
```

### Ruby

```bash
brew install rbenv
rbenv install 3.3.1 # latest
gem install neovim
bundle config --global jobs 15 # 1 less than `sysctl -n hw.ncpu`
```

### Rust

```bash
brew install rustup
rustup-init
rustup toolchain install nightly --allow-downgrade
```

To update:

```bash
rustup update nightly
```

### Python

```bash
cd ~/.local/share/nvim
python3 -m venv .venv
source .venv/bin/activate
python3 -m pip install neovim pynvim
```

### Neovide from source

```bash
cargo install --path .
```

To create a `Neovide.app` icon that will always link to the current version, create an "Application" in Automator with the following:

Make sure to pass input as arguments, and for shell use `/bin/zsh`

```bash
# only pass the first argument (file) to neovide launcher if multiple files are dragged
/bin/zsh -l -c "~/.zsh/bin/n \"$1\""
```

### Fonts

Install the fonts in `Library/Fonts`

### Vim (Legacy)

![screenshot](https://raw.github.com/9mm/dotfiles/master/screenshot.png)

Once you install MacVim, start it and install/update plugins

```
:PlugInstall
:PlugUpdate
:PlugUgrade
```

To create a `MacVim.app` icon that will always link to the current version, create an "Application" in Automator with the following:

Make sure to pass input as arguments, and for shell use `/bin/zsh`

```bash
open -a /opt/homebrew/opt/macvim/MacVim.app "$@"
```

Now save that in /Applications to have a version for the Applications folder that you can link other apps to.

### Spacemacs (Legacy)

```bash
brew tap d12frosted/emacs-plus
brew install emacs-plus --with-24bit-color --with-natural-title-bar --without-spacemacs-icon
yarn global add tern # for the javascript layer
```

Helpful tips in [here](https://elixirforum.com/t/spacemacs-general-discussion-blog-posts-wiki/109?source_topic_id=3191)
