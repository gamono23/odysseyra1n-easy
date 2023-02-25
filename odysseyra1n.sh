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
sedversion=echo $(ideviceinfo -k ProductVersion) | sed -r 's/\./,/g'
# Checks(main)
if [[ -z {$deviceconnection+ERROR} ]];
then
    echo "Connect device or check USB."
else
    if [[ $sedversion -lt 15 ]]; 
        then
            echo "Your version is too new for this!"
        else
            echo "Continuing..."
        sleep 1
        clear
        echo "Hello, "$(whoami) "on" $(ideviceinfo -k ProductVersion)"!"
        # Download checkra1n and procursus bootstrap
        echo "Downloading required packages!"
        mkdir ./work
        if [ "$arch" == 64bit];
            then
                wget https://assets.checkra.in/downloads/linux/cli/x86_64/dac9968939ea6e6bfbdedeb41d7e2579c4711dc2c5083f91dced66ca397dc51d/checkra1n
                wget https://raw.githubusercontent.com/coolstar/Odyssey-bootstrap/master/procursus-deploy-linux-macos.sh
            else
                wget https://assets.checkra.in/downloads/linux/cli/arm64/43019a573ab1c866fe88edb1f2dd5bb38b0caf135533ee0d6e3ed720256b89d0/checkra1n
                wget https://raw.githubusercontent.com/coolstar/Odyssey-bootstrap/master/procursus-deploy-linux-macos.sh
        fi
    fi    
fi