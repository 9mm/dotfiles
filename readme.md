## Installation

* Install the fonts in .vim/font (some are required for vim-powerline fancy status bar)
* I prefer a fork of Macvim that has an OSX-style project drawer. You can find pre-compiled binaries [here](http://pineapple.io/resources/add-file-browser-to-macvim)
* I have purchased [PeepOpen](http://pineapple.io/resources/peepopen-command-t-like-file-navigation). The Vim plugin is contained within this repo, but the paid portion is not, so you will need to buy it or remove it (I highly recommend it. I like it far more than NERDTree, Command-T, FuzzyFinder, etc.). Random tip for PeepOpen: Use `⌘+r` to reload the file tree (if you add new files you must refresh) 
* Install autojump with `brew install autojump`. It's basically a cd command that learns, and allows you to access most-used directories and files by using fuzzy matching. [See here](https://github.com/joelthelion/autojump)
* Inside `.irbrc` is Wirble which colorizes irb. Add it to your project's Gemfile and `bundle install`
* Install [iTerm 2](http://www.iterm2.com/)
* Run `git config --global color.ui true` in terminal. This will add a few lines to your `~/.gitconfig` to allow `git` to be colorized in iTerm 2
* Install oh-my-zsh with `curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh`
 
## Link MacVim to Homebrew Python

Many Vim plugins use Python and have extremely troublesome issues on versions of MacVim compiled with system Python. For this, you want to use Homebrew's version of Python instead. Because I use a custom compiled version of MacVim (see above), it's extra painful.

To fix this situation, do the following:

* Install Homebrew Python with `brew install python`
* If you run `otool -L /Applications/MacVim.app/Contents/MacOS/Vim` and see system Python in that list, you will likely have a problem. Note that if you install MacVim with homebrew your path will need to link to the Cellar directory accordingly.
* Follow [this](https://github.com/Valloric/YouCompleteMe/issues/241#issuecomment-16466715) solution by running the following code. You will need to change the last path (for MacVim and Vim) according to whether you used homebrew. For the homebrew version, point it to the appropriate Cellar directory.

```
install_name_tool -change /System/Library/Frameworks/Python.framework/Versions/2.7/Python /usr/local/Cellar/python/2.7.4/Frameworks/Python.framework/Versions/2.7/Python /Applications/MacVim.app/Contents/MacOS/MacVim
install_name_tool -change /System/Library/Frameworks/Python.framework/Versions/2.7/Python /usr/local/Cellar/python/2.7.4/Frameworks/Python.framework/Versions/2.7/Python /Applications/MacVim.app/Contents/MacOS/Vim
```

That's it. Rerunning `otool` should show you a new output. Now your MacVim is linked to homebrew Python.

[![vim](https://raw.github.com/9mm/dotfiles/master/.vim/screenshot.png)](https://raw.github.com/9mm/dotfiles/master/.vim/screenshot.png)
