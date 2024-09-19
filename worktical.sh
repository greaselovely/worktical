#!/usr/bin/env bash

set -euo pipefail

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
    echo "$1" | base64 -d
}

# ASCII art (base64 encoded)
SURPRISE_ART_1="CgoKCgoKCgoKCgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC4uLCw7Ozs7OzssLCwsCiAgICAgICAgICAgICAgICAgICAgICAgICAgLiw7Jyc7OywuLiw7OzssLCwsLC4nJyc7OywuLgogICAgICAgICAgICAgICAgICAgICAgICwsJycgICAgICAgICAgICAgICAgICAgICcnOzs7Oyw7JycKICAgICAgICAgICAgICAgICAgICAgIDsnICAgICw7QEA7JyAgLEBAOywgQEAsICc7OztAQDssOyc7LgogICAgICAgICAgICAgICAgICAgICAnJyAgLDtAQEBAQCcgIDtAQEBAOyAnJyAgICA7O0BAQEBAOzs7OwogICAgICAgICAgICAgICAgICAgICAgICA7O0BAQEBAOyAgICAnJycgICAgIC4sLDs7O0BAQEBAQEA7OzsKICAgICAgICAgICAgICAgICAgICAgICA7O0BAQEBAQDsgICAgICAgICAgICwgJzs7O0BAQEBAQEBAOzs7LgogICAgICAgICAgICAgICAgICAgICAgICAnJztAQEBAQCwuICAsICAgLiAgICcsOzs7QEBAQEBAOzs7Ozs7CiAgICAgICAgICAgICAgICAgICAgICAgICAgIC4gICAnJzs7Ozs7Ozs7Oyw7Ozs7QEBAQEA7OycgLC46OycKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAnJy4uLCwgICAgICcnJycgICAgJyAgLiw7JwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJycnJycnOjonJycnJycnJwoK"

SURPRISE_ART_2="CgoKCgoKCgoKCgogICAgCQkJCQkgICAgICAjIyAgICAgICAgICAjIwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjIyAgICAgICMjICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMjIyMjIyMjIyMjIyMjCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIyMjIyAgIyMjIyMjICAjIyMjCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIyMgICMjIyMjIyMjIyMjIyMjICAjIyAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIyMgICMjICAgICAgICAgICMjICAjIwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjIyMjICAjIyMjCgoKCgoKCgoKCgoK"

SURPRISE_ART_3="CgoKCgoKCgoKCgogCQkJICAgICAgICAgICAgICAgICAgICAgIyMjIyMjIyMjIyMjCiAgICAgICAgICAgICAgCQkJCSAjIyMjIyMjIyMjIyMjIyMjIyMjIyAKICAgICAgICAgCQkJICAgICAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwoJCQkgICAgICAgICAgICAgIyMjIyAgIyMjIyAgIyMjIyAgIyMjIyAgIyMjIwoJCQkgICAgICAgICAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIAoJCQkgICAgICAgICAgICAgICAjIyMjIyMgICAgIyMjIyAgICAjIyMjIyMKCQkJICAgICAgICAgICAgICAgICAjIyAgICAgICAgICAgICAgICAjIwoKCgoKCgoKCgoKCgo="

# Function to display ASCII art
eyetical() {
    local art=$1
    local delay=${2:-2}
    clear_screen
    decode_ascii_art "$art"
    sleep "$delay"
}

# Function to find random accessible log files
find_random_log() {
    find /var/log -type f -perm +444 2>/dev/null | shuf -n 1
}

# Function to display scrolling text
scrolltical() {
    local file=$(find_random_log)
    if [[ -z "$file" ]]; then
        print_color "YELLOW" "No accessible log file found."
        return
    fi
    local lines=$MAX_LINES
    local total_lines=$(wc -l < "$file")
    if [[ $total_lines -lt $lines ]]; then
        lines=$total_lines
    fi
    local start_line=$((RANDOM % (total_lines - lines + 1) + 1))
    sed -n "${start_line},+${lines}p" "$file" | while IFS= read -r line; do
        echo "$line"
        sleep "$SLEEP_TIME"
    done
}

# Function to display hex dump
hextical() {
    local file=$(find "$HOME" -maxdepth 1 -type f | shuf -n 1)
    head -c 200 "$file" | hexdump -C
    sleep "$SLEEP_TIME"
}

# Function to display file stats
statical() {
    local file=$(find "$HOME" -maxdepth 1 -type f | shuf -n 1)
    stat "$file"
    sleep "$SLEEP_TIME"
}

# Function to display loading bar
loadtical() {
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
toptical() {
    top -l 1 | head -n 15
    sleep "$SLEEP_TIME"
}

# Function to display memory info
memtical() {
    for ((i=1; i<=LINES; i++)); do
        vm_stat | perl -ne '/page size of (\d+)/ and $size=$1; /Pages\s+([^:]+)[^\d]+(\d+)/ and printf("%-16s % 16.2f Mi\n", "$1:", $2 * $size / 1048576);'
    done
}

# Function to display IP addresses
iptical() {
    local ips=($(ifconfig | grep "inet " | grep -v 127.0.0.1 | awk '{print $2}'))
    for ((i=1; i<=100; i++)); do
        move_cursor $(( RANDOM % LINES )) $(( RANDOM % COLUMNS ))
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
        "eyetical \"$SURPRISE_ART_1\""
        "eyetical \"$SURPRISE_ART_2\""
        "eyetical \"$SURPRISE_ART_3\""
        "scrolltical"
        "hextical"
        "statical"
        "loadtical"
        "toptical"
        "memtical"
        "iptical"
    )

    while true; do
        clear_screen
        eval "${functions[$RANDOM % ${#functions[@]}]}"
    done
}

# Run the script
main "$@"
