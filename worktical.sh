#!/usr/bin/env bash

set -uo pipefail

# Configuration
DEFAULT_SLEEP=0.3
MAX_LINES=100

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
    echo -e "${colors[$color_name]}$*${colors[NC]}" >&2
}

# ... [Other utility functions remain unchanged] ...

# Function to find random readable text files
find_random_readable_file() {
    find "$HOME" -type f -readable -size +1c \( -name "*.txt" -o -name "*.log" -o -name "*.md" -o -name "*.csv" \) 2>/dev/null | shuf -n 1
}

# Function to display scrolling text
scrolltical() {
    local file=$(find_random_readable_file)
    if [[ -z "$file" ]]; then
        print_color "YELLOW" "No suitable readable file found for scrolltical."
        return 1
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
    local file=$(find_random_readable_file)
    if [[ -z "$file" ]]; then
        print_color "YELLOW" "No suitable readable file found for hextical."
        return 1
    fi
    head -c 200 "$file" | hexdump -C
    sleep "$SLEEP_TIME"
}

# Function to display file stats
statical() {
    local file=$(find_random_readable_file)
    if [[ -z "$file" ]]; then
        print_color "YELLOW" "No suitable readable file found for statical."
        return 1
    fi
    stat "$file"
    sleep "$SLEEP_TIME"
}

# ... [Other functions remain unchanged] ...

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
        func="${functions[$RANDOM % ${#functions[@]}]}"
        print_color "CYAN" "Executing: $func"
        if ! eval "$func"; then
            print_color "RED" "Function $func failed. Continuing..."
        fi
        print_color "GREEN" "Function completed. Sleeping for 2 seconds..."
        sleep 2
    done
}

# Run the script
main "$@"
