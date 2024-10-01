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

find_random_readable_file() {
    local files=$(find "$HOME" -maxdepth 1 -type f 2>/dev/null)
    local suitable_files=()

    while IFS= read -r file; do
        if [[ -r "$file" ]] && file -b "$file" | grep -qiE "text|script|source"; then
            suitable_files+=("$file")
        fi
    done <<< "$files"

    if [[ ${#suitable_files[@]} -eq 0 ]]; then
        return 1
    fi

    echo "${suitable_files[RANDOM % ${#suitable_files[@]}]}"
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

# Function to simulate packet capture
packetical() {
    local protocols=("TCP" "UDP" "ICMP" "HTTP" "HTTPS" "DNS" "FTP" "SSH")
    local ips=("192.168.1" "10.0.0" "172.16.0" "8.8.8" "1.1.1" "204.79.197")
    local ports=("80" "443" "53" "22" "21" "3306" "5432" "8080")
    local duration=15  # Duration in seconds

    clear_screen

    local start_time=$SECONDS
    local packet_num=1
    while (( SECONDS - start_time < duration )); do
        local src_ip="${ips[$RANDOM % ${#ips[@]}]}.$((RANDOM % 256))"
        local dst_ip="${ips[$RANDOM % ${#ips[@]}]}.$((RANDOM % 256))"
        local protocol="${protocols[$RANDOM % ${#protocols[@]}]}"
        local src_port="${ports[$RANDOM % ${#ports[@]}]}"
        local dst_port="${ports[$RANDOM % ${#ports[@]}]}"
        local size=$((RANDOM % 1465 + 64))  # Packet sizes between 64 and 1528 bytes

        printf "%05d %s.%06d %s:%s → %s:%s %s %d bytes\n" \
               $packet_num \
               "$(date +%H:%M:%S)" "$((RANDOM % 1000000))" \
               "$src_ip" "$src_port" \
               "$dst_ip" "$dst_port" \
               "$protocol" "$size"

        packet_num=$((packet_num + 1))
        sleep 0.1
    done

    sleep "${SLEEP_TIME:-1}"  # Default to 1 second if SLEEP_TIME is not set
}

# Helper function to clear the screen
clear_screen() {
    printf "\033c"
}


snowtical() {
    local characters=(' ' '.' ':' '=' '+' '*' '#' '_' '-' '`' ',')
    local duration=10  # Duration in seconds

    clear_screen
    
    hide_cursor
    
    local end_time=$((SECONDS + duration))
    while [ $SECONDS -lt $end_time ]; do
        for ((y=0; y<LINES; y++)); do
            local line=""
            for ((x=0; x<COLUMNS; x++)); do
                line+="${characters[$RANDOM % ${#characters[@]}]}"
            done
            echo -en "\e[${y};0H$line"
        done
        sleep 0.1
    done
    
    show_cursor
    sleep "$SLEEP_TIME"
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

# Function to display loading bar
loadtical() {
    local width=$((COLUMNS / 2))
    move_cursor 9 0
    printf " |---           Loading..."
    move_cursor 9 $((width-4))
    printf -- '---|\n'
    for ((i=1; i<width; i++)); do  # Changed from i<=width to i<width
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
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS version
        top -l 1 -n 15 | head -n 15
    else
        # Linux version
        top -b -n 1 | head -n 15
    fi
    sleep "$SLEEP_TIME"
}

memtical() {
    if [[ "$(uname)" == "Darwin" ]]; then
        # macOS
        vm_stat | perl -ne '/page size of (\d+)/ and $size=$1; /Pages\s+([^:]+)[^\d]+(\d+)/ and printf("%-16s % 16.2f Mi\n", "$1:", $2 * $size / 1048576);'
    elif [[ "$(uname)" == "Linux" ]]; then
        # Linux (Ubuntu)
        free -m | awk 'NR==2 {printf "%-16s % 16.2f Mi\n", "Free:", $4}
                       NR==2 {printf "%-16s % 16.2f Mi\n", "Used:", $3}
                       NR==2 {printf "%-16s % 16.2f Mi\n", "Total:", $2}'
    fi
}

# Function to display IP addresses
iptical() {
    local ips=()
    if [[ "$(uname)" == "Darwin" ]]; then
        # macOS
        ips=($(ifconfig | grep "inet " | grep -v 127.0.0.1 | awk '{print $2}'))
    elif [[ "$(uname)" == "Linux" ]]; then
        # Linux (Ubuntu)
        ips=($(ip addr | grep "inet " | grep -v 127.0.0.1 | awk '{print $2}'))
    else
        echo "Unsupported operating system"
        return 1
    fi

    if [ ${#ips[@]} -eq 0 ]; then
        print_color "YELLOW" "No IP addresses found."
        return 1
    fi

    for ((i=1; i<=100; i++)); do
        if [ -n "$LINES" ] && [ -n "$COLUMNS" ] && [ $LINES -gt 0 ] && [ $COLUMNS -gt 0 ]; then
            tput cup $(( RANDOM % LINES )) $(( RANDOM % COLUMNS ))
            echo "${ips[RANDOM % ${#ips[@]}]}"
        else
            echo "${ips[RANDOM % ${#ips[@]}]}"
        fi
    done
    sleep "${SLEEP_TIME:-1}"  # Default to 1 second if SLEEP_TIME is not set
}

# Helper function for colored output
print_color() {
    local color_code
    case "$1" in
        "RED") color_code="31" ;;
        "GREEN") color_code="32" ;;
        "YELLOW") color_code="33" ;;
        "BLUE") color_code="34" ;;
        "MAGENTA") color_code="35" ;;
        "CYAN") color_code="36" ;;
        *) color_code="0" ;;
    esac
    printf "\033[${color_code}m%s\033[0m\n" "$2"
}

# New function to simulate network traffic
nettical() {
    local width=$COLUMNS
    local height=$((LINES - 5))
    local nodes=("○" "◇" "□" "△" "▽" "☆" "◎" "◉")
    local connections=("-" "=" "~" "־" "‥" "…")
    
    clear_screen
    
    for ((i=0; i<height; i++)); do
        local line=""
        for ((j=0; j<width; j++)); do
            if ((RANDOM % 10 == 0)); then
                line+="${nodes[RANDOM % ${#nodes[@]}]}"
            elif ((RANDOM % 5 == 0)); then
                line+="${connections[RANDOM % ${#connections[@]}]}"
            else
                line+=" "
            fi
        done
        echo "$line"
        sleep 0.1
    done
    
    sleep "$SLEEP_TIME"
}

# Function to get all "tical" functions
get_tical_functions() {
    declare -F | awk '{print $3}' | grep 'tical$' | grep -v '^_'
}

# Main function to run the script
main() {
    trap show_cursor EXIT
    hide_cursor
    get_terminal_size

    SLEEP_TIME=${1:-$DEFAULT_SLEEP}

    # Automatically populate the functions array
    readarray -t functions < <(get_tical_functions)

    # Special handling for eyetical function
    eyetical_index=$(printf '%s\n' "${functions[@]}" | grep -n '^eyetical$' | cut -d: -f1)
    if [[ -n "$eyetical_index" ]]; then
        eyetical_index=$((eyetical_index - 1))
        functions[$eyetical_index]="eyetical \"$SURPRISE_ART_1\""
        functions+=("eyetical \"$SURPRISE_ART_2\"" "eyetical \"$SURPRISE_ART_3\"")
    fi

    while true; do
        clear_screen
        func="${functions[$RANDOM % ${#functions[@]}]}"
        if ! eval "$func"; then
            print_color "RED" "Function $func failed. Continuing..."
        fi
        sleep 2
    done
}

# Run the script
main "$@"
