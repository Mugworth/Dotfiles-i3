#!/bin/bash
set -o errexit
fzf="$HOME/git/fzf/bin/fzf"
Sessions="$HOME/.config/kitty/sessions/Sesje"

# title=$(rg -No '^\S*' "$Sessions" | /home/kuba/fzf-menu )
title=$(rg -No '^\S*' "$Sessions" | "$fzf" --color=bw --reverse --border)
# title=$(rg -No '^\S*' "$Sessions" | /usr/local/bin/rofi -dmenu -theme $HOME/git/rofi-themes-collection/themes/one-dark.rasi ) #$fzf --color=bw --reverse --border)
cwd=$(rg -N "$title" "$Sessions" | cut -d ' ' -f2)
kitty @ launch --type=tab --tab-title "$title" --cwd="$cwd"
