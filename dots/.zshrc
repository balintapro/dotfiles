# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt share_history          # Share history between sessions
setopt append_history         # Append to history file, don't overwrite
setopt hist_ignore_all_dups    # Avoid duplicates in history
setopt hist_ignore_space       # Don't store commands prefixed with a space
setopt hist_reduce_blanks      # Remove excess spaces

# Reload history from file to keep things in sync between sessions
function sync-history() {
  fc -R ~/.zsh_history
}

HISTIGNORE="ll:ls:cd:pwd"  # Commands that won't be saved to history

setopt autocd beep extendedglob nomatch notify

bindkey -v
# End of lines configured by zsh-newuser-install

autoload -Uz compinit
compinit -C  # Enable compinit caching for faster loading

# source antidote
# source /usr/share/zsh-antidote/antidote.zsh # Linux
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh # OSX

autoload -Uz promptinit && promptinit && prompt default

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

# Lazy load thefuck

alias fuck='eval $(thefuck --alias); fuck'

export PATH=$HOME/local/bin:$PATH
export LD_LIBRARY_PATH="${HOME}/local/lib:${LD_LIBRARY_PATH:-}"
export MANPATH="${HOME}/local/share/man:${MANPATH:-}"
export PATH="$PATH:/Applications/IntelliJ IDEA.app/Contents/MacOS"
# Ensure nvm is loaded correctly
export NVM_DIR="$HOME/.nvm"
unset -f nvm 2>/dev/null  # Unset any existing function named nvm
unset -f node 2>/dev/null  # Unset any existing function named node
unset -f npm 2>/dev/null  # Unset any existing function named npm
unalias nvm 2>/dev/null  # Unset any existing alias named nvm
unalias node 2>/dev/null  # Unset any existing alias named node
unalias npm 2>/dev/null  # Unset any existing alias named npm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion


export PATH="/usr/local/opt/python@3.10/bin:$PATH"

precmd() {
 sort -u -t';' -k2,99 ~/.zsh_history | sort -n -t';' -k1 > ~/.hist.tmp  
 mv ~/.hist.tmp ~/.zsh_history
}

alias gnm="killall -3 gnome-shell"
alias budap="curl wttr.in/Budapest"
alias gmb="curl wttr.in/Gomba"

alias tmux-sess="$HOME/.config/bash/tmux-sess"
alias tmux-win="$HOME/.config/bash/tmux-win"

alias -g conf-ala="cd $HOME/.config/alacritty/; nvim ."
alias -g conf-nvim="cd $HOME/.config/nvim/; nvim ."
alias -g conf-bash="cd $HOME/.config/bash/; nvim ."
alias -g conf-zsh="nvim $HOME/.zshrc"
alias -g conf-tmux="nvim $HOME/.tmux.conf"
alias -g conf-wezterm="nvim $HOME/.wezterm.lua"
alias -g notes="nvim $HOME/.config/bash/notes.md"
alias -g rmd="mdless (fzf)"

alias -g ll="ls -al"
alias -g vim="nvim"
alias -g ys="yarn start"
alias -g yi="yarn install"
alias -g yt="yarn test"

alias -g gcm="git checkout master; git pull"
alias -g gcmb="git checkout -b"
alias -g gp="git pull"

alias -g sess="tmux neww tmux-sess"
alias -g go-mc="cd ~/work/mission-control/; tmux-sess ~/work/mission-control/"
alias -g go-mc-review="cd ~/work/mission-control/; tmux-sess ~/work/reviews/mission-control/"
alias -g go-nest="cd ~/work/nest-client/; tmux-sess ~/work/nest-client/"
alias -g go-fe-apps="cd ~/work/frontend-apps/; tmux-sess ~/work/frontend-apps/"
alias -g go-projects="cd ~/projects/; tmux-sess ~/projects/"
alias -g go-dots="cd ~/projects/dotfiles; tmux-sess ~/projects/dotfiles"

alias java17='export JAVA_HOME=/opt/homebrew/opt/openjdk@17 && export PATH="$JAVA_HOME/bin:$PATH"'
alias java20='export JAVA_HOME=/opt/homebrew/opt/openjdk@20 && export PATH="$JAVA_HOME/bin:$PATH"'
