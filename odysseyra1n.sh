#!/bin/bash
# Variables down there:
os=$(uname)
if [ "$os" == 'Darwin' ]; # This one checks architecture of your CPU
    then
        un=$(uname -m)
            if [ "$un" == 'x86_64' ];
                then 
                arch=64bit
                fi
                if [ "$un" == 'x86_32' ];
                then
                arch=32bit
                fi
                if [ "$un" == 'armv*' ];
                then
                arch=arm
                fi
    else
            un=$(uname -m)
            if [ "$un" == 'x86_64' ];
                then 
                arch=64bit
                fi
                if [ "$un" == 'x86_32' ];
                then
                arch=32bit
                fi
                if [ "$un" == 'armv*' ];
                then
                arch=arm
                fi
fi
deviceconnection=$(ideviceinfo -s) | grep ERROR
# sedversion=echo $(ideviceinfo -k ProductVersion) | sed -r 's/\./,/g'
# sedversion=14 # for testing, remove before somehting like release
# Checks(main)
if [[ -z {$deviceconnection+ERROR} ]];
then
    echo "Connect device or check USB."
else
   # if [[ $sedversion -lt 12 ]]; 
       # then
        #    echo "Your version is too new for this!"
       # else
        #    echo "Continuing..."
        sleep 1
        clear
        echo "Hello, "$(whoami) "on" $(ideviceinfo -k ProductVersion)"!"
        # Download checkra1n and procursus bootstrap
        echo "Downloading required packages!"
        mkdir ./work
         # No more x32 or arm64, mayber later
                wget https://assets.checkra.in/downloads/linux/cli/x86_64/dac9968939ea6e6bfbdedeb41d7e2579c4711dc2c5083f91dced66ca397dc51d/checkra1n -P ./work/
                wget https://raw.githubusercontent.com/coolstar/Odyssey-bootstrap/master/procursus-deploy-linux-macos.sh -P ./work/
        cd work
        chmod +x checkra1n # Hope it doesn't breaks anything # Ok it does...
        chmod +x procursus.sh
        ./checkra1n -c # -c is for cya
    # fi    
fi