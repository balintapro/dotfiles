# Dotfiles

This repository contains my personal dotfiles and some help on a fresh install.

Softwares I usually setup my machines with:

- Wezterm
- NeoVim
- Tmux
- Some bash scirpts

## Installation

You can find the tools and programs you'll need to install for my configuration to work under `Requirement` section.
The `Full system install` is for me to set up new machines with all the usual things for everyday use.

### Linux

- Requirements
  - Aur: `yay -S zsh-antidote` or `git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote`
  - Pacman install: `pacman -S wezterm nvim tmux fzf mc zsh antidote`
- Full system install: - `yay -S zsh-antidote bun` - `pacman -S`

### Osx

- Requirements:
  - `brew install wezterm nvim tmux fzf mc zsh antidote`
- Full system install:
  - `brew install
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
         zoom
`

## Usage

1. Clone this repository to your home folder: `git clone https://github.com/balintapro/dotfiles.git`
2. Change into the dotfiles directory `cd dotfiles`
3. Run the installation script `sh install.sh`:
    - TEST backup, install, save functionalities. Nothing will be changed.
    - BACKUP the folders and files it will modify to this folder `~/bak-dot/`
    - INSTALL will DELETE and REPLACE the following folders:
      - .config/bash
      - .config/mc
      - .config/nvim
    - INSTALL will OVERWRITE the following dotfiles:
      - .tmux.conf
      - .wezterm.lua
      - .zsh_plugins.txt
      - .zshrc
    - SAVE will Copy all matching user dots and configs to the repo.
    - After INSTALL, BACKUP, SAVE a log about the progress will be created in this folder named `install_progress.log`.

## Contributing

If you have any sugestions just open a PR.
