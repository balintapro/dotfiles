# Dotfiles

This repository contains my personal dotfiles, wallpapers and some notes for fresh installs.

Softwares I usually setup my machines with:

- Wezterm
- NeoVim
- Tmux
- Some bash scirpts

Note: If you found the install.sh script useful consider a star for the repo, cheers!

![preview](https://raw.githubusercontent.com/balintapro/dotfiles/main/img/preview.png)

## Installation

You can find the tools and programs you'll need to install for my configuration to work under `Requirement` section.
The `Full system install` is for me to set up new machines with all the usual things for everyday use.

Font <https://github.com/source-foundry/Hack>
Theme <https://github.com/rose-pine>

### Linux

- Requirements
  - Aur: `yay -S zsh-antidote` or `git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote`
  - Pacman install: `pacman -S wezterm nvim tmux fzf mc zsh antidote`
- Full system install: - `yay -S OR pacman -S
          adobe-source-sans-fonts
          apple-fonts
          blueman
          bluez-utils
          bun
          composer
          discord
          firefox
          fzf
          gimp
          github-cli
          google-chrome
          htop
          mariadb
          mc
          neovim
          npm
          ntfs-3g
          nvm
          p7zip
          php-apache
          php-cgi
          php-gd
          powerline-fonts
          ruby-mdless
          rustup
          spotify-launcher
          thefuck
          ttf-fira-code
          ttf-fira-mono
          visual-studio-code-bin
          vlc
          wget
          wireless_tools
          yarn
          yay
          zsh-antidote
`

### Osx

- Requirements:
  - `brew install wezterm nvim tmux fzf mc zsh antidote`
- Full system install:
  - `brew install
        alacritty
        antidote
        ca-certificates
        caffeine
        chatgpt
        choosy
        chromium
        diffutils
        discord
        firefox
        font-hack-nerd-font
        fzf
        gettext
        github
        glib
        libevent
        libpng
        libssh2
        libuv
        libvterm
        lpeg
        luajit
        luv
        midnight-commander
        mpdecimal
        msgpack
        ncurses
        neovim
        nvm
        openssl@3
        pcre
        pcre2
        python@3.12
        readline
        s-lang
        spotify
        sqlite
        thefuck
        tmux
        tree-sitter
        unibilium
        utf8proc
        vault
        visual-studio-code
        xz
        yacreader
        yarn
        zsh
`

## Usage

![install script](https://raw.githubusercontent.com/balintapro/dotfiles/main/img/install.png)

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

## Tmux todo

don't forget to install tpm

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

tmux source ~/.tmux.conf
```

Then Press prefix + I install plugins.

## Contributing

If you have any sugestions just open a PR.
