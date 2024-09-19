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

# Function to simulate packet capture
packetical() {
    local protocols=("TCP" "UDP" "ICMP" "HTTP" "HTTPS" "DNS" "FTP" "SSH")
    local ips=("192.168.1." "10.0.0." "172.16.0." "8.8.8.8" "1.1.1.1" "204.79.197.")
    local ports=("80" "443" "53" "22" "21" "3306" "5432" "8080")
    local duration=15  # Duration in seconds

    clear_screen
    print_color "CYAN" "Packet Capture Simulation"

    local start_time=$SECONDS
    local packet_num=1
    while (( SECONDS - start_time < duration )); do
        local src_ip="${ips[$RANDOM % ${#ips[@]}]}$((RANDOM % 256))"
        local dst_ip="${ips[$RANDOM % ${#ips[@]}]}$((RANDOM % 256))"
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

    sleep "$SLEEP_TIME"
}


snowtical() {
    local characters=(' ' '.' ':' '=' '+' '*' '#' '%' '@')
    local duration=10  # Duration in seconds

    clear_screen
    print_color "WHITE" "Old TV Static Simulation"
    
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
    top -l 1 | head -n 15
    sleep "$SLEEP_TIME"
}

# Function to display memory info
memtical() {
    vm_stat | perl -ne '/page size of (\d+)/ and $size=$1; /Pages\s+([^:]+)[^\d]+(\d+)/ and printf("%-16s % 16.2f Mi\n", "$1:", $2 * $size / 1048576);'
    sleep "$SLEEP_TIME"
}

# Function to display IP addresses
iptical() {
    local ips=($(ifconfig | grep "inet " | grep -v 127.0.0.1 | awk '{print $2}'))
    if [ ${#ips[@]} -eq 0 ]; then
        print_color "YELLOW" "No IP addresses found."
        return 1
    fi
    for ((i=1; i<=100; i++)); do
        if [ $LINES -gt 0 ] && [ $COLUMNS -gt 0 ]; then
            move_cursor $(( RANDOM % LINES )) $(( RANDOM % COLUMNS ))
            echo "${ips[RANDOM % ${#ips[@]}]}"
        else
            echo "${ips[RANDOM % ${#ips[@]}]}"
        fi
    done
    sleep "$SLEEP_TIME"
}

# New function to simulate network traffic
nettical() {
    local width=$COLUMNS
    local height=$((LINES - 5))
    local nodes=("○" "◇" "□" "△" "▽" "☆" "◎" "◉")
    local connections=("-" "=" "~" "־" "‥" "…")
    
    clear_screen
    print_color "CYAN" "Network Traffic Simulation"
    
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
