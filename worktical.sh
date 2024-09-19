#!/usr/bin/env bash

set -euo pipefail

# Improved script inspired by hollywood
# https://github.com/dustinkirkland/hollywood

# Configuration
DEFAULT_SLEEP=0.3
MAX_LINES=100
LOGFILE_PERMISSIONS=644

# Color definitions
declare -A colors=(
    [RED]='\033[0;31m'
    [GREEN]='\033[0;32m'
    [YELLOW]='\033[0;33m'
    [BLUE]='\033[0;34m'
    [MAGENTA]='\033[0;35m'
    [CYAN]='\033[0;36m'
    [WHITE]='\033[0;37m'
    [NC]='\033[0m' # No Color
)

# Function to print colored output
print_color() {
    local color_name=$1
    shift
    echo -e "${colors[$color_name]}$*${colors[NC]}"
}

# Function to hide cursor
hide_cursor() {
    tput civis
}

# Function to show cursor
show_cursor() {
    tput cnorm
}

# Function to clear screen
clear_screen() {
    tput clear
}

# Function to move cursor
move_cursor() {
    tput cup $1 $2
}

# Function to get terminal dimensions
get_terminal_size() {
    read -r LINES COLUMNS < <(stty size)
}

# Function to decode base64 ASCII art
decode_ascii_art() {
    echo "$1" | tr -d '[:space:]' | base64 -d
}

# ASCII art (base64 encoded, all on one line with no spaces)
EYE_ART="CgoKCgoKCgoKCgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC4uLCw7Ozs7OzssLCwsCiAgICAgICAgICAgICAgICAgICAgICAgICAgLiw7Jyc7OywuLiw7OzssLCwsLC4nJyc7OywuLgogICAgICAgICAgICAgICAgICAgICAgICwsJycgICAgICAgICAgICAgICAgICAgICcnOzs7Oyw7JycKICAgICAgICAgICAgICAgICAgICAgIDsnICAgICw7QEA7JyAgLEBAOywgQEAsICc7OztAQDssOyc7LgogICAgICAgICAgICAgICAgICAgICAnJyAgLDtAQEBAQCcgIDtAQEBAOyAnJyAgICA7O0BAQEBAOzs7OwogICAgICAgICAgICAgICAgICAgICAgICA7O0BAQEBAOyAgICAnJycgICAgIC4sLDs7O0BAQEBAQEA7OzsKICAgICAgICAgICAgICAgICAgICAgICA7O0BAQEBAQDsgICAgICAgICAgICwgJzs7O0BAQEBAQEBAOzs7LgogICAgICAgICAgICAgICAgICAgICAgICAnJztAQEBAQCwuICAsICAgLiAgICcsOzs7QEBAQEBAOzs7Ozs7CiAgICAgICAgICAgICAgICAgICAgICAgICAgIC4gICAnJzs7Ozs7Ozs7Oyw7Ozs7QEBAQEA7OycgLC46OycKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAnJy4uLCwgICAgICcnJycgICAgJyAgLiw7JwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJycnJycnOjonJycnJycnJwoK"

ALIEN_ART="CgoKCgoKCgoKCgogICAgCQkJCQkgICAgICAjIyAgICAgICAgICAjIwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjIyAgICAgICMjICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMjIyMjIyMjIyMjIyMjCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIyMjIyAgIyMjIyMjICAjIyMjCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIyMgICMjIyMjIyMjIyMjIyMjICAjIyAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIyMgICMjICAgICAgICAgICMjICAjIwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjIyMjICAjIyMjCgoKCgoKCgoKCgoK"

UFO_ART="CgoKCgoKCgoKCgogCQkJICAgICAgICAgICAgICAgICAgICAgIyMjIyMjIyMjIyMjCiAgICAgICAgICAgICAgCQkJCSAjIyMjIyMjIyMjIyMjIyMjIyMjIyAKICAgICAgICAgCQkJICAgICAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwoJCQkgICAgICAgICAgICAgIyMjIyAgIyMjIyAgIyMjIyAgIyMjIyAgIyMjIwoJCQkgICAgICAgICAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIAoJCQkgICAgICAgICAgICAgICAjIyMjIyMgICAgIyMjIyAgICAjIyMjIyMKCQkJICAgICAgICAgICAgICAgICAjIyAgICAgICAgICAgICAgICAjIwoKCgoKCgoKCgoKCgo="

# Function to display ASCII art
display_ascii_art() {
    local art=$1
    local delay=${2:-2}
    clear_screen
    decode_ascii_art "$art"
    sleep "$delay"
}

# Function to display scrolling text
scroll_text() {
    local file=$1
    local lines=${2:-$MAX_LINES}
    local start_line=$(shuf -i 1-"$(wc -l < "$file")" -n 1)
    sed -n "${start_line},+${lines}p" "$file" | while IFS= read -r line; do
        echo "$line"
        sleep "$SLEEP_TIME"
    done
}

# Function to display hex dump
hex_dump() {
    local file=$(find "$HOME" -maxdepth 1 -type f | shuf -n 1)
    head -c 200 "$file" | hexdump -C
    sleep "$SLEEP_TIME"
}

# Function to display file stats
display_stats() {
    local file=$(find "$HOME" -maxdepth 1 -type f | shuf -n 1)
    stat "$file"
    sleep "$SLEEP_TIME"
}

# Function to display loading bar
display_loading_bar() {
    local width=$((COLUMNS / 2))
    move_cursor 9 0
    printf " |---           Loading..."
    move_cursor 9 $((width - 4))
    printf -- '---|\n'
    for ((i=1; i<=width; i++)); do
        move_cursor 10 $i
        printf "#"
        sleep "$SLEEP_TIME"
    done
    move_cursor 9 16
    printf "Loading Complete\n\n\n"
    sleep 1
}

# Function to display top processes
display_top() {
    top -b -n1 | head -n 15
    sleep "$SLEEP_TIME"
}

# Function to display memory info
display_memory() {
    for ((i=1; i<=LINES; i++)); do
        free -m | awk '/Mem:/ {printf "Memory: %d/%d MB (%.2f%%)\n", $3, $2, $3/$2 * 100}'
    done
}

# Function to display IP addresses
display_ip_addresses() {
    local ips=($(hostname -I))
    for ((i=1; i<=100; i++)); do
        move_cursor $(shuf -i 1-"$LINES" -n 1) $(shuf -i 1-"$COLUMNS" -n 1)
        echo "${ips[RANDOM % ${#ips[@]}]}"
    done
}

# Main function to run the script
main() {
    trap show_cursor EXIT
    hide_cursor
    get_terminal_size

    SLEEP_TIME=${1:-$DEFAULT_SLEEP}

    # Array of all available functions
    functions=(
        "display_ascii_art '$EYE_ART'"
        "display_ascii_art '$ALIEN_ART'"
        "display_ascii_art '$UFO_ART'"
        "scroll_text /var/log/syslog"
        "hex_dump"
        "display_stats"
        "display_loading_bar"
        "display_top"
        "display_memory"
        "display_ip_addresses"
    )

    while true; do
        clear_screen
        eval "${functions[RANDOM % ${#functions[@]}]}"
    done
}

# Run the script
main "$@"
