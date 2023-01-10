# ------------------------
# -------VARIABLES--------
# ------------------------
ETS_GOOGLE_PATH="/Users/danick/danick.blouin.1\@etsmtl.net\ -\ Google\ Drive/My\ Drive/2022_AUTOMNE"
UNI_PATH="/Users/danick/Documents/universite"

eval "$(/opt/homebrew/bin/brew shellenv)"


# vim mode
set -o vi


# --------------------
# -------ALIAS--------
# --------------------
alias ls="ls --color -h"
alias la="ls -a"
alias ll="ls --color -l"
alias l1="ls -1"
alias c="clear"
alias github="cd ~/Documents/code/github && ls"
alias gc="git clone"
alias py="python3"
alias bashrc="vi ~/.bashrc"
alias dw="cd ~/Downloads && ls -1"
alias grep="grep --color=always"
alias less="less -R"
alias vi="nvim"


# Temporary aliases for uni
alias uni="cd $UNI_PATH && ls -1"
alias guni="cd $ETS_GOOGLE_PATH && ls -1"


# REMOVE MACOS WARNING FOR BASH
if [ "$(uname)" = "Darwin" ]
then
	export BASH_SILENCE_DEPRECATION_WARNING=1
fi


# --------------------
# ---AUTOCOMPLETION---
# --------------------

# git autocompletion
if [ -f ~/.git-completion.bash ]; then
	. ~/.git-completion.bash
fi

# pomo autocompletion
complete -C pomo pomo

# java
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
