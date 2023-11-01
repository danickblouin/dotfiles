# ------------------------
# -------VARIABLES--------
# ------------------------
export EDITOR="nvim"
export GITHUB=~/Documents/code/github
export GOOGLE="/Users/danick/danick.blouin.1@etsmtl.net - Google Drive/My Drive"
export ONEDRIVE="/Users/danick/OneDrive - ETS"
export VISUAL="nvim"
export sioyek="/Applications/sioyek.app/Contents/MacOS/"
export DOTFILES=~/Documents/code/github/dotfiles
export SCRIPTS=~/Documents/code/github/bash-script
export GEM_HOME=$HOME/gems
export UNI=~/Documents/universite

export PKG_CONFIG_PATH="/opt/homebrew/opt/readline/lib/pkgconfig"

# vim mode
set -o vi

# REMOVE MACOS WARNING FOR BASH AND EXPORT PATH
if [ "$(uname)" = "Darwin" ]; then
	eval "$(/opt/homebrew/bin/brew shellenv)" # add homebrew to path
	export BASH_SILENCE_DEPRECATION_WARNING=1
	export PATH="$HOME/gems/bin:$HOME/.rbenv/bin:/opt/homebrew/opt/openjdk/bin:/opt/homebrew/bin/pip3:/usr/local/clamav/bin:/usr/local/clamav/sbin:$PATH"
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

# Function to convert markdown to pdf without the header in the markdown file
pandoc-pdf() {
    if [ -z "$3" ]; then
        margin=1
    else
        margin="$3"
    fi
    pandoc "$1" -o "$2" --variable geometry:"margin=${margin}in"
}
