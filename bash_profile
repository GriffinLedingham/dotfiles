### Autocomplete On Arrows
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

### Colors
export CLICOLOR=1
#export LSCOLORS=GxFxCxDxBxegedabagaced

### Command Line Status
source ~/.bash/git-prompt
export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[01;32m\]\[\033[0;33m\]$(parse_git_branch_or_tag)\[\033[m\]\[\033[01;34m\]\w\[\033[00m\]\$ '

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Set Node Modules Path To Relative Dir
export NODE_PATH=./node_modules

### Aliases
#Kano Aliases
alias  kano='cd ~/Kano/apps_mobile/apps/xwars'
alias  kanossh='sh ~/.ssh/kano.sh'
alias  kanod='sh ~/.kanohub_rsync_rem_to_loc.sh'
alias  kanou='sh ~/.kanohub_rsync_loc_to_rem.sh'
alias  pika='ssh -i ~/pikalytics.pem ec2-user@34.197.205.97'
alias  watch='sh ~/watcher.sh'

# Vim Aliases
alias  vim='nvim'
alias  vi='nvim'
alias  v='nvim'
alias  vimrc='nvim ~/Git/dotfiles/init.vim'
alias  bashrc='nvim ~/Git/dotfiles/bash_profile'
alias  gitconfig='nvim ~/Git/dotfiles/gitconfig'

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
PATH="~/Qt/5.8/clang_64/bin:${PATH}"
export PATH

# GREP
alias grep='grep -n --color'

parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

parse_git_tag () {
  git describe --tags 2> /dev/null
}

parse_git_branch_or_tag() {
  local OUT="$(parse_git_branch)"
  if [ "$OUT" == " ((no branch))" ]; then
    OUT="($(parse_git_tag))";
  fi
  echo $OUT
}

export ANDROID_HOME="/Users/griffinledingham/Library/Android/sdk/"
