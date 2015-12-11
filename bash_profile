### Autocomplete On Arrows
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

### Colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

### Command Line Status
source ~/.bash/git-prompt
export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[01;32m\]@\[\033[01;32m\]\h\[\033[00m\]:\[\033[0;33m\]$(parse_git_branch_or_tag)\[\033[m\]\[\033[01;34m\]\w\[\033[00m\]\$ '

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Set Node Modules Path To Relative Dir
export NODE_PATH=./node_modules

### Aliases
#Dir Aliases
alias  kano='cd ~/Kano/apps_mobile/apps/xwars'

# Vim Aliases
alias  vim='nvim'
alias  vi='nvim'
alias  v='nvim'
alias  vimrc='nvim ~/dotfiles/init.vim'
alias  bash_profile='nvim ~/dotfiles/bash_profile'
alias  gitconfig='nvim ~/dotfiles/gitconfig'

# Script Aliases
alias  kanossh='sh ~/SSH/kano.sh'

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
