# Variables
ETS_GOOGLE_PATH="/Users/danick/danick.blouin.1\@etsmtl.net\ -\ Google\ Drive/My\ Drive/2022_AUTOMNE"
UNI_PATH="/Users/danick/Documents/universite"

eval "$(/opt/homebrew/bin/brew shellenv)"


# vim mode
set -o vi


# Aliases
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
alias vim="nvim"


# Temporary aliases for uni
alias lab1="code $UNI_PATH/log210/s20223-log210-lab01-v2-s20221-equipe-06 && code $UNI_PATH/log210/log210-systeme-gestion-bordereau-node-express-ts/"
alias uni="cd $UNI_PATH && ls -1"
alias guni="cd $ETS_GOOGLE_PATH && ls -1"
alias log210="cd $UNI_PATH/log210 && ls -1"
alias glog210="cd $ETS_GOOGLE_PATH/LOG210-02 && ls -1"


# REMOVE MACOS WARNING FOR BASH
if [ "$(uname)" = "Darwin" ]
then
	export BASH_SILENCE_DEPRECATION_WARNING=1
fi


# GIT AUTOCOMPLETION
if [ -f ~/.git-completion.bash ]; then
	. ~/.git-completion.bash
fi

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
