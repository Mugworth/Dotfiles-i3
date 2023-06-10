#!/bin/bash

# increase key speed via rate change
xset r rate 300 30
# Map the caps lock key to ctrl
setxkbmap -option caps:ctrl_modifier
# But when it is pressed only once, treat
# it as escape
killall xcape 2>/dev/null ; xcape -e '#66=Escape'
# Map the menu button to right super as well.
