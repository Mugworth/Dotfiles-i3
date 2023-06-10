#!/bin/bash
path="$HOME/Documents/CODING/"
selected_dir() {
  find $path/* -maxdepth 1 -mindepth 1 -type d | \
  sed "s~$path/~~" | \
  fzf | \
  sed "s~^~$path/~"
}

tab_name=$(echo $selected_dir | sed "s~$path/~~")
kitty @ focus-tab --match title:$tab_name 2>/dev/null || kitty @ launch --type=tab --tab-title $tab_name --cwd $selected_dir
