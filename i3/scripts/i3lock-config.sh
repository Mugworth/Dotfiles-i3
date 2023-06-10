#!/bin/bash

BLANK='#2E3440'
CLEAR='#BF616A'
DEFAULT='#3B4252'
TEXT='#D8DEE9'
WRONG='#D08770'
VERIFYING='#A3BE8C'

PICTURE="/tmp/i3lock-config.jpg"
scrot $PICTURE

BLUR="55x36"
convert $PICTURE -blur $BLUR $PICTURE
i3lock -F -n -i $PICTURE \
	--insidever-color=$CLEAR     \
	--ringver-color=$VERIFYING   \
	\
	--insidewrong-color=$CLEAR   \
	--ringwrong-color=$WRONG     \
	\
	--inside-color=$BLANK        \
	--ring-color=$DEFAULT        \
	--line-color=$BLANK          \
	--separator-color=$DEFAULT   \
	\
	--verif-color=$TEXT          \
	--wrong-color=$TEXT          \
	--time-color=$TEXT           \
	--date-color=$TEXT           \
	--layout-color=$TEXT         \
	--keyhl-color=$WRONG         \
	--bshl-color=$WRONG          \
	\
	--screen 1                   \
	--blur 4                     \
	--clock                      \
	--indicator                  \
	--time-str="%H:%M"           \
	--date-str="%A, %m %Y"       \
	--radius=105                  \
	--ind-pos="x+958:y+543"      
rm $PICTURE
