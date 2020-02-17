#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '
[[ ${TERM} == xterm* ]] && PROMPT_COMMAND='printf "\033]0;%s\007" "${PWD/#$HOME/\~}"'

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

HISTCONTROL=ignoreboth
HISTSIZE=-1
HISTFILESIZE=-1
shopt -s histappend
shopt -s checkwinsize

eval "$(dircolors -b ~/.config/colors/dircolors)"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias vi='vim'
alias cdw='cd ~/workspace'

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

export EDITOR=vim
export VIMINIT='let $VIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $VIMRC'

# Ask for gpg password on console
export GPG_TTY=$(tty)

# Fix java problem on sway
export _JAVA_AWT_WM_NONREPARENTING=1

# Fix maven-git-versioning-extension problem on Intellij
export VERSIONING_DISABLE=true

source /usr/share/bash-completion/bash_completion
