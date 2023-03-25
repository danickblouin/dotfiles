# ------------------------
# -------VARIABLES--------
# ------------------------
export EDITOR="nvim"
export GITHUB="/Users/danick/Documents/code/github"
export GOOGLE="/Users/danick/danick.blouin.1@etsmtl.net - Google Drive/My Drive"
export ONEDRIVE="/Users/danick/OneDrive - ETS"
export UNI="/Users/danick/Documents/universite"
export VISUAL="nvim"
export sioyek="/Applications/sioyek.app/Contents/MacOS/"
export DOTFILES="/Users/danick/Documents/code/github/dotFiles"
export SCRIPTS="/Users/danick/Documents/code/github/bash-script"

# java
export PATH="/opt/homebrew/opt/openjdk/bin:/opt/homebrew/bin/pip3:$PATH"

eval "$(/opt/homebrew/bin/brew shellenv)"

# vim mode
set -o vi


# --------------------
# -------ALIAS--------
# --------------------
alias datef='date +%Y-%m-%dT%H:%M'
alias diff='diff --color'
alias dot='cd $DOTFILES'
alias dw='cd ~/Downloads && ls -1'
alias github='cd ~/Documents/code/github && ls'
alias grep='grep --color=always'
alias less='less -R'
alias ls='ls -h --color'
alias py='python3'
alias scripts='cd $SCRIPTS'
alias vi='nvim'


# Temporary aliases for uni
alias guni='cd "$GOOGLE" && ls -1'
alias ouni='cd "$ONEDRIVE" && ls -1'
alias uni="cd $UNI && ls -1"


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


# -------------------
# ------COLORS-------
# -------------------
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
	PS1+="${BOLD}${DARK}${PWD#"${PWD%/*/*/*}/"} "
	PS1+="${RESET}\$ -> "
}
PROMPT_COMMAND="__ps1"
