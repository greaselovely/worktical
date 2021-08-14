#!/bin/bash

# this is a script inspired by hollywood.
# https://github.com/dustinkirkland/hollywood
# I wrote this to be a bit more simplified 
# and more specifically can be used in a closed
# environment using native tools or tools
# that are installed as core OS utilities

# ascii images are base64 encoded to keep them intact and decoded 
# at runtime so that they appear as expected.
# also did it for 'reasonable obfuscation' as to not ruin the surprise ¯\_(ツ)_/¯
# as long as the base64 string is one line with no CR / LF 
# it will work as expected  

# to do
# incorporate tmux like hollywood.  I dig that.
# set term width: https://stackoverflow.com/questions/5243445/bash-command-to-change-size-of-bash-window
# just use a lame local fake log file : https://www.thegeekstuff.com/2011/08/linux-var-log-files/

# can be run with $1 being specific to change the sleep timer within the script
# if not specified, it defaults to .3 seconds.  try worktical.sh .1 for fast, worktical.sh 3 for super slow.

# this is a typical log file that we'll use
# change it or copy something into this location for it to run.
# longer the file the better the random behavior of the script.
# sometimes this is a log file permissions problem which is why you may need to find something to put here.

log=/var/log/dmesg

# console to green
tput setaf 2
# hide cursor
tput civis

if [[ $1 == "" ]]
        then
                sec=".3"
        else
                sec=$1
fi

function eyetical(){
        clear
        eye="CgoKCgoKCgoKCgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC4uLCw7Ozs7OzssLCwsCiAgICAgICAgICAgICAgICAgICAgICAgICAgLiw7Jyc7OywuLiw7OzssLCwsLC4nJyc7OywuLgogICAgICAgICAgICAgICAgICAgICAgICwsJycgICAgICAgICAgICAgICAgICAgICcnOzs7Oyw7JycKICAgICAgICAgICAgICAgICAgICAgIDsnICAgICw7QEA7JyAgLEBAOywgQEAsICc7OztAQDssOyc7LgogICAgICAgICAgICAgICAgICAgICAnJyAgLDtAQEBAQCcgIDtAQEBAOyAnJyAgICA7O0BAQEBAOzs7OwogICAgICAgICAgICAgICAgICAgICAgICA7O0BAQEBAOyAgICAnJycgICAgIC4sLDs7O0BAQEBAQEA7OzsKICAgICAgICAgICAgICAgICAgICAgICA7O0BAQEBAQDsgICAgICAgICAgICwgJzs7O0BAQEBAQEBAOzs7LgogICAgICAgICAgICAgICAgICAgICAgICAnJztAQEBAQCwuICAsICAgLiAgICcsOzs7QEBAQEBAOzs7Ozs7CiAgICAgICAgICAgICAgICAgICAgICAgICAgIC4gICAnJzs7Ozs7Ozs7Oyw7Ozs7QEBAQEA7OycgLC46OycKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAnJy4uLCwgICAgICcnJycgICAgJyAgLiw7JwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJycnJycnOjonJycnJycnJwoK"
        base64 -d <<< $eye
        sleep 2
}

function alientical(){
        clear
        alien="CgoKCgoKCgoKCgogICAgCQkJCQkgICAgICAjIyAgICAgICAgICAjIwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjIyAgICAgICMjICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMjIyMjIyMjIyMjIyMjCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIyMjIyAgIyMjIyMjICAjIyMjCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIyMgICMjIyMjIyMjIyMjIyMjICAjIyAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIyMgICMjICAgICAgICAgICMjICAjIwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjIyMjICAjIyMjCgoKCgoKCgoKCgoK"
        base64 -d <<< $alien
        sleep 2
}

function ufotical(){
        clear
    ufo="CgoKCgoKCgoKCgogCQkJICAgICAgICAgICAgICAgICAgICAgIyMjIyMjIyMjIyMjCiAgICAgICAgICAgICAgCQkJCSAjIyMjIyMjIyMjIyMjIyMjIyMjIyAKICAgICAgICAgCQkJICAgICAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwoJCQkgICAgICAgICAgICAgIyMjIyAgIyMjIyAgIyMjIyAgIyMjIyAgIyMjIwoJCQkgICAgICAgICAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIAoJCQkgICAgICAgICAgICAgICAjIyMjIyMgICAgIyMjIyAgICAjIyMjIyMKCQkJICAgICAgICAgICAgICAgICAjIyAgICAgICAgICAgICAgICAjIwoKCgoKCgoKCgoKCgo="
    base64 -d <<< $ufo
        sleep 4
}

function deniedtical(){
        acde="CgoKCgoKCgoKCgoKCgkJCSMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwoJCQkjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKCQkJIyMjCUFDQ0VTUyBERU5JRUQJQUNDRVNTIERFTklFRAlBQ0NFU1MgREVOSUVECSAjIyMKCQkJIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCgkJCSMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwoKCgoKCgoKCgoKCgoKCgoKCgoK"
        acde=$(base64 -d <<< $acde)
        i=1
        tput setaf 1
        clear
        tput cup 10 0
        while [[ $i -lt 5 ]] 
                do
                        echo "$acde"
                        i=$(($i + 1))
                        sleep 1
                        clear
                        tput cup 10 0
                        sleep .7
        done
        tput setaf 2

}

function grantical(){
        pegr="CgoKCgoKCgoKCgoKCgkJCSMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwoJCQkjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKCQkJIyMjCVBFUk1JU1NJT04gR1JBTlRFRCAtIFFVRVJZIFJVTk5JTkcgLSBTVEFOREJZCSAjIyMKCQkJIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCgkJCSMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwoKCgoKCgoKCgoKCgoKCgoKCgoK"
        pegr=$(base64 -d <<< $pegr)
        tput setaf 7
        clear
        tput cup 10 0
        echo "$pegr"
        sleep 5
        tput setaf 2
}

function readdowntical(){
        tput cup 0 0
        read row col <<< $(stty size)
        nol=$(cat $log | wc -l)
        startat=$(printf "shuf -i 1-%d -n 1" ${nol})
        startat=$($startat)
        endat=$(($startat + $row))
        readlog=$(sed -n -e ${startat},${endat}p ${log})
        IFS=$'\n'
        for line in $readlog
                do
                        echo "$line"
                        sleep $sec
        done
        unset IFS
}


function searchtical(){
        clear
        read row col <<< $(stty size)
        row=$(($row - 3))
        # choose random color
        tput setaf $(shuf -i 0-9 -n 1)
        nol=$(cat $log | wc -l)
        # choose a random line from $log
        # on MacOS I had a problem of using a variable inside the shuf command
        # where it normally worked on RHEL.  Lame.  
        # So I use printf to dump it in.  Seems to work really well to my surprise.
        shuffle=$(printf "shuf -i 1-%d -n 1" $nol )
        string=$(sed -n $($shuffle)p $log)
        # from that random line, grab the last word with any characters
        # and grep $log and display the result
        # Also found an issue that the script stops if the grep command somehow gets 
        # into a blank character.  So I'm just checking it if it exists, and running
        # another function just to keep things going.  Not heavily tested.
        if [[ $string ]]
                then
                        grep ${string##* } $log
                else
                        grantical
        fi
        sleep 3
        tput setaf 2
}

function hextical(){
        tput cup 0 0
        for file in $(find ${HOME} -maxdepth 1 -type f | sort -R)
                do
                        head -c 4096 $file | hexdump -C
                        sleep $sec
        done
}

function statical(){
        for file in $(find ${HOME} -maxdepth 1 -type f)
                do
                        clear
                        tput cup 10 0
                        stat $file
                        sleep $sec
        done
}

function readuptical(){
        read row col <<< $(stty size)
        row=$(($row - 3 ))
        nol=$(cat $log | wc -l)
        startat=$(printf "shuf -i 1-%d -n 1" $nol)
        startat=$($startat)
        endat=$(($startat + $row))
        shuffle=$(printf "sed -n -e %d,%d" ${startat} ${endat})
        readlog=$(${shuffle}p ${log})
        IFS=$'\n'
        clear
        for line in $readlog
                do
                        tput cup $row 0
                        echo "$line"
                        sleep $sec
                        row=$(($row - 1))
                        # this can be annoying or cool, uncomment if you want random colors per line
                        #tput setaf $(shuf -i 0-9 -n 1)
        done
        unset IFS

}

function loadtical(){
        read row col <<< $(stty size)
        # this will determine the halfway point across the screen
        # as the loading bar will only go to the middle of the screen
        half=$(($col / 2))
        clear
        tput cup 9 0
        printf "%30s\n" "Loading..."
        i=0
        while [[ $i -lt $half ]]
                do
                        printf "#"
                        tput cup 10 $i
                        sleep .1
                        i=$(($i + 1))
        done
}


### do stuff and things ###

# creates a list of all of the functions above so that we can execute them 
# without statically calling them

functical=$(declare -F | awk '{print $3}')

while true
        do
                # we take all of the functions and shuffle them so
                # that the output is random
                stuffandthings=$(shuf -e $functical)
                $stuffandthings
done
