## 9mm .dotfiles

### Neovim:

![screenshot](https://raw.github.com/9mm/dotfiles/master/screenshot2.png)

### Vim:

![screenshot](https://raw.github.com/9mm/dotfiles/master/screenshot.png)

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


### Git

Enable colorization

    git config --global color.ui true


### Homebrew

    brew analytics off
    brew update
    brew install git nvm python neovide ack zoxide ripgrep fzf fd wget rbenv
    brew install pnpm httpie jq htop lazygit tmux diff-so-fancy # extra goodies
    brew install knqyf263/pet/pet

### Node

You should install latest node with `nvm`, and then globally add `yarn` with npm. From there, you can
use yarn to globally install the rest of your packages. Do not use homebrew to install yarn.

I use `pnpm` now, but I still use yarn for several projects, so that's where I keep my global packages.

### Other

Set more cores for Bundler

    bundle config --global jobs 15 # 1 less than `sysctl -n hw.ncpu`


### Fonts

Install the fonts in `Library/Fonts`


### Oh-My-ZSH

Add a ZSH distribution and Fish-style autosuggestions (plugin is already loaded
within `~/.zshrc`):

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
    git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm


### Neovide

Update plugins with `:Lazy`

To create a `Neovide.app` icon that will always link to the current version, create an "Application" in Automator with the following:

Make sure to pass input as arguments, and for shell use `/bin/zsh`

    # only pass the first argument (file) to neovide launcher if multiple files are dragged
    /bin/zsh -l -c "~/.zsh/bin/n \"$1\""


### Vim (Legacy)

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


### Spacemacs

    brew tap d12frosted/emacs-plus
    brew install emacs-plus --with-24bit-color --with-natural-title-bar --without-spacemacs-icon
    yarn global add tern # for the javascript layer

Helpful tips in [here](https://elixirforum.com/t/spacemacs-general-discussion-blog-posts-wiki/109?source_topic_id=3191)
