#!/bin/bash
deviceconnection=$(ideviceinfo -s) | grep ERROR 
deviceversion=$(ideviceinfo -k ProductVersion)
sedversion=echo $deviceversion | sed -r 's/\./,/g'
if [[ -z {$deviceconnection+ERROR} ]];
then
    echo "Connect device or check USB."
else
    if [[ $sedversion -lt 15 ]]; 
        then
            echo "Your version is too new for this!"
        else
            echo "Continuing..."
    fi
    sleep 1
    clear
    echo "Hello, "$(whoami) "on" $(ideviceinfo -k ProductVersion)"!"
fi