#!/usr/bin/env zsh

# Helper script to conveniently create a backup and/or apply it.
# Use with caution, paths are hardcoded (kinda).

PROFILE="$HOME/.profile"

PREFIX="$HOME/.config/"
FILES=( "bat/" "dunst/" "fontconfig/" "i3/" "i3status-rust/" "kitty/" "picom.conf"
  "zsh/custom" "zsh/.zshrc" "nvim/lua/user" "pythonrc.py" )

make_backup() {
  echo "Copying $PROFILE..."
  cp $PROFILE .

  for conf in "${FILES[@]}"; do
    parent=${conf%%/*}
    echo "Copying $PREFIX$conf into $parent..."
    cp -r $PREFIX$conf $parent
  done
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
