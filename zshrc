# Path to your oh-my-zsh configuration.
ZSH=$HOME/workspace/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git command-not-found debian mvn)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

alias apg='/usr/bin/apg -a1 -M SNCL -m10'
alias go='gnome-open'
alias vl='vim -u /usr/share/vim/vim73/macros/less.vim'
alias gsr='DISPLAY=:0 gnome-shell --replace &'
alias rimg='rename "s/^(IMG_)|(MVI_)//"'
alias lsimg="while IFS= read -r -d '' i; do echo; echo $i;  ls -1 $i | head -1; ls -1 $i | tail -1; done < <(find . -type d -print0 | sort -z)"

eval $(dircolors ~/.dircolors)
