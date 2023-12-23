# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000000000
SAVEHIST=10000000000
setopt autocd beep extendedglob nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install

autoload -Uz compinit
compinit
# End of lines added by compinstall

# source antidote
source /usr/share/zsh-antidote/antidote.zsh # Linux
# source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh # OSX

autoload -Uz promptinit && promptinit && prompt default

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load
eval $(thefuck --alias)

export PATH=$HOME/local/bin:$PATH
export LD_LIBRARY_PATH=$HOME/local/lib:$LD_LIBRARY_PATH
export MANPATH=$HOME/local/share/man:$MANPATH
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export FZF_DEFAULT_OPTS="
	--color=fg:#908caa,bg:#191724,hl:#ebbcba
	--color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
	--color=border:#403d52,header:#31748f,gutter:#191724
	--color=spinner:#f6c177,info:#9ccfd8,separator:#403d52
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"

export PATH="/usr/local/opt/php@7.4/bin:$PATH"
export PATH="/usr/local/opt/php@7.4/sbin:$PATH"

eval $(thefuck --alias)

alias gnm="killall -3 gnome-shell"
alias budap="curl wttr.in/Budapest"
alias gmb="curl wttr.in/Gomba"

alias tmux-sess="$HOME/.config/bash/tmux-sess"
alias tmux-win="$HOME/.config/bash/tmux-win"

alias -g conf-nvim="cd $HOME/.config/nvim/ && nvim ."
alias -g conf-bash="cd $HOME/.config/bash/ && nvim ."
alias -g conf-zsh="nvim $HOME/.zshrc"
alias -g conf-tmux="nvim $HOME/.tmux.conf"
alias -g conf-wezterm="nvim $HOME/.wezterm.lua"
alias -g notes="nvim $HOME/.config/bash/notes.md"
alias -g rmd="mdless '$(fzf)'"


alias -g ll="ls -al"
alias -g vim="nvim"
alias -g ys="yarn start"
alias -g yi="yarn install"

alias -g gcm="git checkout master && git pull"
alias -g gcmb="git checkout -b"
alias -g gp="git pull"

# alias -g sess="tmux neww tmux-sess"
# alias -g go-mc="cd ~/work/mission-control/ && tmux-sess ~/work/mission-control/"
# alias -g go-mc-review="cd ~/work/mission-control/ && tmux-sess ~/work/reviews/mission-control/"
# alias -g go-nest="cd ~/work/nest-client/ && tmux-sess ~/work/nest-client/"
# alias -g go-fe-apps="cd ~/work/frontend-apps/ && tmux-sess ~/work/frontend-apps/"

