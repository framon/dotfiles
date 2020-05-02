#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '
[[ ${TERM} == xterm* ]] && PROMPT_COMMAND='printf "\033]0;%s\007" "${PWD/#$HOME/\~}"'
[[ ${TERM} == xterm* ]] && trap 'TXT="${BASH_COMMAND//[^[:print:]]/}"; [[ "$TXT" == "setGitPrompt" ]] && TXT="${PWD/#$HOME/\~}"; printf "\033]0;%s\007" "$TXT"' DEBUG

if [ -f /usr/lib/bash-git-prompt/gitprompt.sh ]; then
   GIT_PROMPT_THEME=Custom
   GIT_PROMPT_THEME_FILE=~/.config/git-prompt-colors.sh
   source /usr/lib/bash-git-prompt/gitprompt.sh
fi

XDG_CONFIG_HOME=$HOME/.config
XDG_CACHE_HOME=$HOME/.cache
XDG_DATA_HOME=$HOME/.local/share
XDG_PICTURES_DIR=$HOME/pictures
export XDG_CONFIG_HOME XDG_CACHE_HOME XDG_DATA_HOME XDG_PICTURES_DIR

export GRADLE_USER_HOME=$XDG_CACHE_HOME/gradle
export INPUTRC=$XDG_CONFIG_HOME/inputrc
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/config

export EDITOR=vim
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

HISTCONTROL=ignoreboth
HISTSIZE=-1
HISTFILESIZE=-1
shopt -s histappend
shopt -s checkwinsize

eval "$(dircolors -b ~/.config/colors/dircolors)"
alias ls='ls --color=auto'
alias ip='ip --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

## What about using vim as pager and maintain less config simple for large files?
view () { /usr/share/vim/vim82/macros/less.sh "$@";}
export LESS='-RFx2'
export LESSOPEN='| file=%s; /usr/bin/lesspipe.sh "$file" | /usr/bin/pygmentize'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias rm='rm -I'
alias vi='vim'
alias cdw='cd ~/workspace'

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Ask for gpg password on console
export GPG_TTY=$(tty)

# Fix java problem on sway
export _JAVA_AWT_WM_NONREPARENTING=1

# Fix maven-git-versioning-extension problem on Intellij
export VERSIONING_DISABLE=true

source /usr/share/bash-completion/bash_completion
