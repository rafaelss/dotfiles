alias ll='ls -GlFh'
alias la="ll -a"
alias ls="ls -hGB"
alias be="bundle exec"

export HOMEBREW_EDITOR="subl -n"
export BUNDLER_EDITOR="subl"
export GEM_EDITOR="subl"

export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=100000
export HISTFILESIZE=100000
export INPUTRC=$HOME/.inputrc

shopt -s histappend

PS1='\n\[\e[0;32m\]$(parse_git_branch)\[\e[m\]\[\e[0;33m\]\w\[\e[m\]\n$ '

function reload() {
  source ~/.bash_profile
}

function parse_git_branch() {
  branch=$(/usr/bin/env git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
  if [ -n "$branch" ]; then
    echo -ne "[$branch] ";
  fi
}

function rails_new() {
  rails new $1 -m http://datamapper.org/templates/rails.rb --skip-bundle -O -S -d postgresql -T
}
