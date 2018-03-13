## 9mm .dotfiles

### Cool Features

* Fullscreen overlay terminal with `<c-i>` (use iTerm3 `plist`)
* ZSH autocompletion with `<c-e>`
* Optional MOTD for remembering hotkeys in `.zshrc`
* Snippet storage via `pet list`. Type `prev` to store previous command
* JSON printing with `echo '{"coffee": "time"}' | jq`
* Autojump to common directories with `j <partial name>`
* In-file searching with `ack <search term> -i`


### Basic Setup

Set a super fast keyboard repeat

    defaults write NSGlobalDomain KeyRepeat -int 1


### iTerm 3

Download and install [iTerm3](https://www.iterm2.com/version3.html)

Install the [Dracula](https://draculatheme.com/iterm/) color scheme and activate it.

Use the config in `Library/Preferences/com.googlecode.iterm2.plist`


### Git

Enable colorization

    git config --global color.ui true


### Homebrew

    brew analytics off
    brew update
    brew install git python macvim ack autojump ctags fzf curl wget rbenv yarn
    brew install httpie jq rename tree tmate # extra goodies
    brew install knqyf263/pet/pet


### Oh-My-ZSH

Add a ZSH distribution and Fish-style autosuggestions (plugin is already loaded within `~/.zshrc`):

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions


### Vim

Once you install MacVim, start it and run

    :PlugInstall

You can update plugins at any time by running

    :PlugUpdate

You can update `vim-plug` by running

    :PlugUgrade


### Spacemacs

    brew tap d12frosted/emacs-plus
    brew install emacs-plus --with-24bit-color --with-natural-title-bar --without-spacemacs-icon
    yarn global add tern # for the javascript layer

Helpful tips in [here](https://elixirforum.com/t/spacemacs-general-discussion-blog-posts-wiki/109?source_topic_id=3191)


### Fonts

Install the fonts in `Library/Fonts`


### Preview

![screenshot](https://raw.github.com/9mm/dotfiles/master/screenshot.png)
