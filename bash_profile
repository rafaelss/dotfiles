alias ls="ls -hGB"
alias ll="ls -l"
alias la="ll -a"
alias be="bundle exec"
export HOMEBREW_EDITOR="subl -n"
export BUNDLER_EDITOR="subl"
export GEM_EDITOR="subl"

shopt -s nocaseglob
shopt -s histappend

HISTCONTROL=ignoredups:ignorespace
INPUTRC=$HOME/.inputrc


PS1='\n\[\e[0;32m\]$(parse_git_branch)\[\e[m\]\[\e[0;33m\]\w\[\e[m\]\n$ '

function reload() {
  source ~/.bash_profile
}

function parse_git_branch() {
  branch=$(/usr/bin/git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
  if [ -n "$branch" ]; then
    echo -ne "[$branch] ";
  fi
}

function rails_new() {
  rails new $1 -m http://datamapper.org/templates/rails.rb --skip-bundle -O -S -d postgresql -T
}

