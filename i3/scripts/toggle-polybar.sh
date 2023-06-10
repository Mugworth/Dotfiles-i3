#!/bin/sh

if [ -f /tmp/polybarhidden ]; then
  polybar-msg cmd show
  i3-msg gaps top all set 14
  i3-msg gaps inner all set 14
  rm /tmp/polybarhidden
else
  polybar-msg cmd hide
  i3-msg gaps top all set 0
  i3-msg gaps inner all set 0
  touch /tmp/polybarhidden
fi
