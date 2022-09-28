eval "$(/opt/homebrew/bin/brew shellenv)"

#Aliases
alias ls="ls --color -h"
alias la="ls -a"
alias c="clear"
alias github="cd ~/Documents/code/github && ls"
alias gc="git clone"
alias uni="cd ~/Documents/universite && ls"
alias guni="cd ~/danick.blouin.1\@etsmtl.net\ -\ Google\ Drive/My\ Drive//2022_AUTOMNE/ && ls"
alias py="python3"
alias bashrc="vi ~/.bashrc"
alias dw="cd ~/Downloads && ls"


# REMOVE MACOS WARNING FOR BASH
if [ "$(uname)" = "Darwin" ]
then
	export BASH_SILENCE_DEPRECATION_WARNING=1
fi
