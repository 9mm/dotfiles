## 9mm .dotfiles

### Neovim + Neovide

![Neovim + Neovide](https://raw.github.com/9mm/dotfiles/master/screenshots/home.png)
![lualine.nvim](https://raw.github.com/9mm/dotfiles/master/screenshots/mode-n.png)
![lualine.nvim](https://raw.github.com/9mm/dotfiles/master/screenshots/mode-r.png)
![lualine.nvim](https://raw.github.com/9mm/dotfiles/master/screenshots/mode-i.png)
![lazy.nvim](https://raw.github.com/9mm/dotfiles/master/screenshots/ls.png)
![mason.nvim](https://raw.github.com/9mm/dotfiles/master/screenshots/mm.png)
![LSP + nvim-cmp](https://raw.github.com/9mm/dotfiles/master/screenshots/cmp.png)
![LSP + nvim-cmp](https://raw.github.com/9mm/dotfiles/master/screenshots/cmp2.png)
![ccc.nvim](https://raw.github.com/9mm/dotfiles/master/screenshots/cp.png)
![mini.files](https://raw.github.com/9mm/dotfiles/master/screenshots/fe.png)
![vim-floaterm + oh-my-zsh](https://raw.github.com/9mm/dotfiles/master/screenshots/iterm.png)
![vim-floaterm + oh-my-zsh](https://raw.github.com/9mm/dotfiles/master/screenshots/iterm2.png)
![lsp-config](https://raw.github.com/9mm/dotfiles/master/screenshots/lspc.png)
![vim-floaterm + lazygit](https://raw.github.com/9mm/dotfiles/master/screenshots/lz.png)
![vim-floaterm + lazygit](https://raw.github.com/9mm/dotfiles/master/screenshots/lz2.png)
![telescope.nvim](https://raw.github.com/9mm/dotfiles/master/screenshots/gg.png)
![telescope.nvim](https://raw.github.com/9mm/dotfiles/master/screenshots/q.png)
![telescope.nvim](https://raw.github.com/9mm/dotfiles/master/screenshots/telescope.png)
![treesitter playground](https://raw.github.com/9mm/dotfiles/master/screenshots/ts.png)
![undotree](https://raw.github.com/9mm/dotfiles/master/screenshots/undo.png)
![which-key.nvim](https://raw.github.com/9mm/dotfiles/master/screenshots/wk.png)
![cellular-automaton.nvim](https://raw.github.com/9mm/dotfiles/master/screenshots/car.png)

### Cool Features

* A Neovim/Vim config with full LSP support that I have refined for 10+ years
* Fullscreen overlay terminal with `<c-i>` (use iTerm3 `plist`)
* ZSH autocompletion with `<c-e>`
* Snippet storage via `pet list`. Type `prev` to store previous command
* Zoxide (previously autojump) to common directories with `j <partial name>`
* Lots of Mac optimizations

### Basic Setup

Set a super fast keyboard repeat

    defaults write NSGlobalDomain KeyRepeat -int 1

If you're on a Mac, I recommend remapping your `Caps Lock` key to a `Control` key in keyboard settings.

### iTerm 3

Download and install [iTerm3](https://www.iterm2.com/downloads.html)

Install the [Dracula](https://draculatheme.com/iterm/) color scheme and activate it.

Open iTerm preferences, and choose `General > Preferences`. Check the box for
`load preferences from custom folder` and choose the `iTerm` folder which
includes `com.googlecode.iterm2.plist`. Before loading, you may want to change
`zesty` to your own home folder via find/replace.

### Oh-My-ZSH

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

### Homebrew

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

### Homebrew

    brew analytics off
    brew update
    brew install make cmake git python zoxide ripgrep fzf fd wget tmux
    brew install httpie jq htop lazygit tmux diff-so-fancy
    brew install knqyf263/pet/pet

### Node

    brew install pnpm node@20 # LTS
    pnpm -g install neovim nuxi@latest wrangler

### Ruby

    brew install rbenv
    rbenv install 3.3.1 # latest
    gem install neovim
    bundle config --global jobs 15 # 1 less than `sysctl -n hw.ncpu`

### Rust

    brew install rustup
    rustup-init
    rustup component add rustfmt --toolchain nightly
    rustup component add rust-analyzer

To update:

    rustup update nightly

### Python

    python3 -m venv .venv
    source .venv/bin/activate
    python3 -m pip install neovim pynvim

### Neovide from source

    cargo install --path .

To create a `Neovide.app` icon that will always link to the current version, create an "Application" in Automator with the following:

Make sure to pass input as arguments, and for shell use `/bin/zsh`

    # only pass the first argument (file) to neovide launcher if multiple files are dragged
    /bin/zsh -l -c "~/.zsh/bin/n \"$1\""

### Fonts

Install the fonts in `Library/Fonts`

### Vim (Legacy)

![screenshot](https://raw.github.com/9mm/dotfiles/master/screenshot.png)


Once you install MacVim, start it and run

    :PlugInstall

You can update plugins at any time by running

    :PlugUpdate

You can update `vim-plug` by running

    :PlugUgrade

To create a `MacVim.app` icon that will always link to the current version, create an "Application" in Automator with the following:

Make sure to pass input as arguments, and for shell use `/bin/zsh`

    open -a /opt/homebrew/opt/macvim/MacVim.app "$@"

Now save that in /Applications to have a version for the Applications folder that you can link other apps to.

### Spacemacs (Legacy)

    brew tap d12frosted/emacs-plus
    brew install emacs-plus --with-24bit-color --with-natural-title-bar --without-spacemacs-icon
    yarn global add tern # for the javascript layer

Helpful tips in [here](https://elixirforum.com/t/spacemacs-general-discussion-blog-posts-wiki/109?source_topic_id=3191)
