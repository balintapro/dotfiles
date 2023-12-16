# Dotfiles

This repository contains my personal dotfiles and some help on a fresh install.

Softwares:

- Wezterm
- NeoVim
- Tmux
- Some bash scirpts

## Installation

I usually setup my machines with the stuff listed below. You can find the stuff you'll need to install under `Only for dotfiles` section. The `Full system install` is only for me to set up new machines for everyday use.

### Linux

- Only for dotfiles: - `yay -S zsh-antidote` or `git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote` - `pacman -S wezterm nvim tmux fzf mc zsh antidote`
- Full system install: - `yay -S zsh-antidote bun` - `pacman -S`

### Osx

- Only dotfiles: - `brew install wezterm nvim tmux fzf mc zsh antidote`
- Full system install: - `brew install
antidote
bun
caffeine
chromium
composer
curl
deno
docker
firefox
fzf
gh
git
github
google-chrome
hiddenbar
htop
kubernetes-cli
lua
midnight-commander
neovim
ripgrep
sevenzip
slack
spotify
thefuck
tmux
visual-studio-code
wezterm
zoom`

## Usage

1. Clone this repository to your home folder:

   ```shell
   git clone https://github.com/balintapro/dotfiles.git
   ```

2. Change into the dotfiles directory:

   ```shell
   cd dotfiles
   ```

3. Run the installation script:
   - Run the script: `sh install.sh`
   - It will DELETE and REPLACE the following folders:
     - .config/bash
     - .config/mc
     - .config/nvim
   - It will OVERWRITE the following dotfiles:
     - .tmux.conf
     - .wezterm.lua
     - .zsh_plugins.txt
     - .zshrc
   - A log about the progress willbe created in theis folder named `install_progress_log.txt`.

## Contributing

If you have any sugestions just open a PR.
