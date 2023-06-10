#!/bin/bash
set -o errexit
tabs_number=$(kitty @ ls | jq '.[0].tabs | map(.id) | .[]' | wc -l)
tab_array=($(kitty @ ls | jq '.[0].tabs | map(.id) | .[]'))
if [[ $1 > $tabs_number ]]; then
  kitty @ kitten new-tab/New_tab.py
  # kitty @ launch --type=overlay zsh -c "$(read input; echo input) | xargs -I _ kitty @ launch --type=tab --tab-title _"
elif [[ $1 -le $tabs_number ]]; then
  kitty @ focus-tab -m id:${tab_array[$(($1-1))]}
fi
