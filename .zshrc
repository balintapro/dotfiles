# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000000000
SAVEHIST=10000000000
setopt autocd beep extendedglob nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install

alias gnm="killall -3 gnome-shell"
alias budap="curl wttr.in/Budapest"
alias gmb="curl wttr.in/Gomba"

alias ll="ls -al"
alias vim="nvim"
alias ys="yarn start"
alias yi="yarn install"

# The following lines were added by compinstall
zstyle :compinstall filename '/home/balint/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# now, simply add these two lines in your ~/.zshrc
# source antidote

source /usr/share/zsh-antidote/antidote.zsh
autoload -Uz promptinit && promptinit && prompt default

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load


eval $(thefuck --alias)

export PATH=~/pebble/bin:$PATH
