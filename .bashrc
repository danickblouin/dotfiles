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
export DOTFILES="/Users/danick/Documents/code/github/dotfiles"
export SCRIPTS="/Users/danick/Documents/code/github/bash-script"

# vim mode
set -o vi

# REMOVE MACOS WARNING FOR BASH AND EXPORT PATH
if [ "$(uname)" = "Darwin" ]; then
	eval "$(/opt/homebrew/bin/brew shellenv)" # add homebrew to path
	export BASH_SILENCE_DEPRECATION_WARNING=1
	export PATH="/opt/homebrew/opt/openjdk/bin:/opt/homebrew/bin/pip3:/usr/local/clamav/bin:/usr/local/clamav/sbin:$PATH"
fi


# --------------------
# -------ALIAS--------
# --------------------
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi


# --------------------
# ---AUTOCOMPLETION---
# --------------------

# brew autocompletion
if type brew &>/dev/null
then
	HOMEBREW_PREFIX="$(brew --prefix)"
	if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]
	then
		source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
	else
		for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*
		do
		  [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
		done
	fi
fi


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
