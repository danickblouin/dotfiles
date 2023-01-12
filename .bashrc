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

# TIRED OF LOOKING UP COLORS
RESET="\[\e[0m\]"
DEF="\[\e[39m\]"
BLACK="\[\e[30m\]"
BRIGHT_BLACK="\[\e[90m\]"
RED="\[\e[31m\]"
GREEN="\[\e[32m\]"
YELLOW="\[\e[33m\]"
BLUE="\[\e[34m\]"
MAGENTA="\[\e[35m\]"
CYAN="\[\e[36m\]"
WHITE="\[\e[37m\]"
BRIGHT_WHITE="\[\e[97m\]"
DARK_GREY="\[\e[90m\]"
LIGHT_RED="\[\e[91m\]"
LIGHT_GREEN="\[\e[92m\]"
LIGHT_YELLOW="\[\e[93m\]"
BOLD="\[\e[1m\]"
DARK=$BRIGHT_BLACK

# CUSTOM PROMPT
__ps1() {
	local E="$?"
	export PS1=""
	if [ "$E" = "0" ]; then
		PS1+="${GREEN}√${DARK} "
	else
		PS1+="${RED}?${E}${DARK} "
	fi
	branch="$(git branch --show-current 2> /dev/null)"
	if [ "$branch" != "" ]; then
		PS1+="(${YELLOW} ${branch}${DARK}) "
	fi
	PS1+="${BOLD}${DARK}${PWD#"${PWD%/*/*}/"} "
	PS1+="${RESET}\$ -> "
}
PROMPT_COMMAND="__ps1"

