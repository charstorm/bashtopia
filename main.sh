# Script to load all the utilities from bashtopia.
# Source this file from ~/.bashrc


# Enable all the child scripts.
_bashtopia_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$_bashtopia_dir/src/add_paths_from_file.sh" "$HOME/.paths.txt"
source "$_bashtopia_dir/src/bookmark_utils.sh"


# Common bash configurations
export HISTCONTROL=erasedups
shopt -s histappend
HISTSIZE=10000
HISTFILESIZE=20000
shopt -s checkwinsize
export LC_ALL=C


# Aliases
alias ls="ls --color=auto"
alias ll="ls -lrthF"
alias gg="bookmark_add"
alias hh="bookmark_cd"
alias pp="bookmark_search"


# set PS1 and bookmark current location.
# This allows to access a terminal's CWD using numeric bookmarks.
TERMID=$(tty | sed -e "s|.*/||g")
export PS1='\[\e[0;34m\]\n[$TERMID] $(bookmark_add $TERMID)\t | \u@\h | \w \n==> \[\e[m\]'


# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


# Colors for man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
