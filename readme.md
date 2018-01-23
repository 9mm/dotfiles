## 9mm .dotfiles

### iTerm 3

Download and install [iTerm3](https://www.iterm2.com/version3.html)

Use the config in `Library/Preferences/com.googlecode.iterm2.plist`

Install the [Dracula](https://draculatheme.com/iterm/) color scheme and activate it.


### Git

Enable colorization

    git config --global color.ui true


### Homebrew

    brew analytics off
    brew update
    brew install macvim ack autojump
    brew install httpie pet rename tree tmate # optional


### Oh-My-ZSH

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


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
    npm install -g tern # for the javascript layer

Helpful tips in [here](https://elixirforum.com/t/spacemacs-general-discussion-blog-posts-wiki/109?source_topic_id=3191)


### Fonts

Install the fonts in `Library/Fonts`

[![vim](https://raw.github.com/9mm/dotfiles/master/.vim/screenshot.png)](https://raw.github.com/9mm/dotfiles/master/.vim/screenshot.png)
