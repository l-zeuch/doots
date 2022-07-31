# Dotfiles

This repository contains my personal dotfiles, feel free to browse.

## Installing

Be VERY careful when you want to just blindly copy this configuration -- I've
ignored a few files which you may or may not need. This is to avoid bloating the
repository unnecessarily.

Carefully read the files and, if present, folder READMEs to get a grip of what
you need to do.

## Software

My current system runs on [ArchLinux](https://archlinux.org/) (btw).

### Graphics

For my desktop, I use

* [i3-gaps](https://github.com/Airblader/i3): window manager
* [i3status-rust](https://github.com/greshake/i3status-rust): status bar
* [picom](https://github.com/yshui/picom): compositor
* [dunst](https://dunst-project.org/): notification server

All running under X11 as display server.

### Terminal

* [ZSH](https://www.zsh.org): default shell with [oh-my-zsh](https://ohmyz.sh/)
* [kitty](https://github.com/kovidgoyal/kitty): terminal emulator
* [tmux](https://github.com/tmux/tmux): session management
* [Neovim](https://neovim.io/): editor
* [bat](https://github.com/sharkdp/bat): better `cat(1)`
* [exa](https://the.exa.website/): better `ls(1)`

### Plugins

Some applications I run also have plugins installed, which are for reasons of
viewability not included here.

#### Neovim

As configuration framework I use [AstroNvim](https://astronvim.github.io); you
should view the [`plugins/init.lua`](nvim/plugins/init.lua) file for additional
plugins added.

#### Oh-My-Zsh

* [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
* [zsh-completions](https://github.com/zsh-users/zsh-completions)
* [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

#### Tmux

* [tpm](https://github.com/tmux-plugins/tpm)
* [tmux-battery](https://github.com/tmux-plugins/tmux-battery)
* [tmux-copycat](https://github.com/tmux-plugins/tmux-copycat)
* [tmux-online-status](https://github.com/tmux-plugins/tmux-online-status)
* [tmux-open](https://github.com/tmux-plugins/tmux-open)
* [tmux-plugin-sysstat](https://github.com/samoshkin/tmux-plugin-sysstat)
* [tmux-prefix-highlight](https://github.com/tmux-plugins/tmux-prefix-highlight)
* [tmux-sidebar](https://github.com/tmux-plugins/tmux-sidebar)
