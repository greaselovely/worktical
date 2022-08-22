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

# can be run with $1 being specific to change the sleep timer within the script
# if not specified, it defaults to .3 seconds.  try worktical.sh .1 for fast, worktical.sh 3 for super slow.
# to run a specific function, use worktical.sh help, or --h, or -h, or shirt (we're just looking for 'h')

# we do a find on all files in /var/log, create an array of those log files for reference
# in the $log variable in the while loop which uses shuf to randomly select a file
# to use for the function being called.  

logFiles=()

for file in $(find /var/log -type f -perm 644 -print 2>/dev/null)
do
	logFiles=(${logFiles[@]} "$file")
done


function normalize () {
	# console to green
	tput setaf 2
	# hide cursor
	tput civis
}


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
        tput setaf 1
        clear
        tput cup 10 0
        for i in {1..5}
                do
                        echo "$acde"
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

function downtical(){
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
        row=$(stty size | awk '{print $1}')
        nol=$(cat $log | wc -l)
		# choose a random line from $log
        # on MacOS I had a problem of using a variable inside the shuf command
        # where it normally worked on RHEL.  Lame.  
        # So I use printf to dump it in.  Seems to work really well to my surprise.
        shuffle=$(printf "shuf -i 1-%d -n 1" $nol )
        string=$(sed -n $($shuffle)p $log)
	noe=$(grep -i "${$string##* }" $log | wc -l)
        center=$(($row-$noe))
	center=$((center / 2))
        if [[ $center -lt 1 ]]
			then
				clear
			else
				clear
				tput setaf $(shuf -i 0-9 -n 1)
				tput cup ${center} 0
				grep -i "${$string##* }" $log
				sleep 3
		fi		
        normalize
}

function hextical(){
        tput cup 0 0
		for i in {1..7}
				do
					head -c 200 $(shuf -e $(find ${HOME} -maxdepth 1 -type f) -n 1) | hexdump -C
					sleep $sec
        done
}

function statical(){
		clear
		for i in {1..9}
			do
                        clear
                        tput cup 10 0
                        stat $(shuf -e $(find ${HOME} -maxdepth 1 -type f) -n 1)
                        sleep $sec
        done
}

function readtical(){
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
	third=$(($col / 3))
	i=1
	clear
	tput cup 9 0
	printf " |---           Loading..."
	tput cup 9 $(($half-4))
	printf -- '---|\n'
	while [[ $i -lt $half ]]
		do
			tput cup 10 $i
			printf "#"
			sleep $sec
			i=$(($i + 1))
	done
	tput cup 9 16
	printf "Loading Complete\n\n\n"
	sleep 1
}


function toptical (){
	clear
	for i in {1..10}
		do
			tput cup 10 0
			top -b -n1 | head -n 15
			sleep $sec
	done
	
}


function memtical(){
	i=1
	read row col <<< $(stty size)
	until [[ $i -eq $row ]]
		do
			free -m | grep -i mem | cut -c 16-
			i=$(($i+1))
	done
}

function ifconfigtical () {
	i=1
	read row col <<< $(stty size)
	myip=$(ifconfig | grep -i "inet" | awk 'NR=1 {print $2}')
	clear
	until [[ $i -eq 100 ]]
		do
			tput cup $(shuf -i 1-${row} -n 1) $(shuf -i 1-${col} -n 1)
			echo $myip
			i=$(($i+1))
	done
}


function randwordtical (){
	i=1
	read row col <<< $(stty size)
	nol=$(cat $log | wc -l)
	# choose a random line from $log
	string=$(sed -n $(shuf -i 1-${nol} -n 1)p $log)
	# from that random line, grab the last word in that line
	# and grep all lines from $log
	noe=$(grep ${string##* } $log | wc -l)
	clear
	until [[ $i -eq 150 ]]
		do
			tput setaf $(shuf -i 0-9 -n 1) 
			tput cup $(shuf -i 1-${row} -n 1) $(shuf -i 1-${col} -n 1)
			echo ${string##* }
			i=$(($i+1))
	done
	normalize
}

function _exit() {
	echo "bye Felicia..."
}


### do stuff and things ###

normalize

# creates a list of all of the functions above so that we can execute them 
# without statically calling them
functical=$(declare -F | awk '{print $3}')

if [[ $1 =~ "help" ]] 
	then
		PS3="Choose a function to run: "
		sec=.1
		clear
		select function in $functical
			do
				if [[ $function == "_exit" ]]
					then
						exit 0
				fi
				$function
		done
	else
		while true
			do
				if [[ $1 =~ [0-9] ]]
					then
						sec=$1
				elif [[ ! $1 ]]
					then 
						sec=.3
				else
					echo "Dummy..."
					exit 0
				fi
                # we take all of the functions and shuffle them so
                # that the output is random
				log=$(shuf -n 1 -e $logFiles)
				work=$(shuf -n 1 -e $functical)
                		trap '$work; unset work' DEBUG
				trap 'echo "\"${work}\" command failed with exit code $?."' EXIT
		done
fi

