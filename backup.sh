#!/usr/bin/env zsh

#
# Helper script to conveniently create a backup and/or apply it.
# Use with caution, I'm not very good with shell scripts.
# Requires ZSH to run (because I used ZSH-specific features, duh).
#

PROFILE="$HOME/.profile"

# Tell this script where your dotfiles you wish to backup are located.
# Personally, I only care about those in my .config folder, and thus this script
# is kinda written with that in mind.
PREFIX="$HOME/.config/"

# Files to backup. If it's entire directories, postpend them with a slash.
# For individual files, don't do that.
#
# Order matters here: List directories first, then specific files, especially
# when you have individual files in directories you want to copy.
FILES=( "bat/" "dunst/" "fontconfig/" "i3/" "i3status-rust/" "kitty/"
  "tmux/" "rofi/" "picom.conf" "zsh/custom" "zsh/.zshrc" "zsh/.zlogin" "pythonrc.py" )

# We remove the currently present parent folders to avoid copying our (new)
# backups into these parent folders, thus keeping the structure tight and
# actually usable.
clean() {
  for conf in "${FILES[@]}"; do
    parent=${conf%%/*}
    rm -rf $parent
  done
}

make_backup() {
  clean

  echo "\033[32;1m==>\033[0m \033[1mCopying $PROFILE...\033[0m"
  cp $PROFILE profile

  for conf in "${FILES[@]}"; do
    parent=${conf%%/*}
    echo "\033[32;1m==>\033[0m \033[1mCopying $PREFIX$conf into $parent...\033[0m"
    cp -r $PREFIX$conf $parent
  done

  # Remove this directory because it contains (generally speaking) git
  # repositories, we don't want that submodule jank(tm). If you have your own
  # plugins written and don't track them with git feel free to modify this line.
  rm -rf zsh/plugins
  rm -rf tmux/plugins
}

show_help() {
  echo "Usage:
  backup [action]
    Create and/or apply a backup of dotfiles.

    Configure the paths and whatnot by editing the script.

  Actions:
    create: create a backup and store it in this folder.

    -h | --help: Show this message. This is the default."
  exit 0
}

case "$1" in
  -h | --help )
    show_help
    ;;
  create )
    make_backup
    ;;
  * )
    show_help
    ;;
esac
