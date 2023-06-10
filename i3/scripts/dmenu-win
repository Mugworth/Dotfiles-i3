#!/bin/sh

echo_err() {
    echo "$0: $1" >&2
}

err() {
    echo_err "$1"
    exit 1
}

check_dep() {
    command -v "$1" > /dev/null || err "$1 is required: $2"
}

# We don't check if dmenu is installed because someone
# may want to replace it via DMENU var
check_dep xdotool https://github.com/jordansissel/xdotool
check_dep xprop   https://gitlab.freedesktop.org/xorg/app/xprop

get_windows_ids() {
    list="$(xprop -root _NET_CLIENT_LIST 2> /dev/null)" || err "Failed to get windows list"
    echo "$list" | sed 's/^.\+# //; s/, \+/\n/g' | sort | uniq
}

get_window_name() {
    wm_name="$(xprop -id "$1" WM_NAME 2> /dev/null)" || return 1
    echo "$wm_name" | sed 's/^.\+ = //; s/^"//; s/"$//'
}

# Get windows in format "$num $id $name"
get_windows() {
    get_windows_ids | while read -r id; do
        if ! name="$(get_window_name "$id")"; then
            echo_err "Failed to get window name of $id"
            continue
        fi
        echo "$id $name"
    done | nl -w 1 -s ' '
}

get_window_id() {
    cut -d ' ' -f 2
}

get_windows_menu() {
    cut -d ' ' -f '1,3-' | sed 's/\([[:digit:]]\+\) \+/\1	/' | column -t -s '	'
}

get_num_from_selection() {
    echo "$1" | cut -d ' ' -f 1
}

get_selected_window() {
    grep "^$(get_num_from_selection "$1") "
}

focus_window() {
    xdotool windowactivate "$1"
}

[ -z "$DMENU" ] && DMENU='dmenu -i -l 10 -p Windows'

windows="$(get_windows)"

selection="$(echo "$windows" | get_windows_menu | eval "$DMENU")"
[ -z "$selection" ] && exit 0

focus_window "$(echo "$windows" | get_selected_window "$selection" | get_window_id)"
