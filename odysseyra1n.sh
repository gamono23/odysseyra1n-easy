#!/bin/bash
deviceconnection=$(ideviceinfo -s) | grep ERROR 
if [[ -z {$deviceconnection+ERROR} ]];
then
echo "Connect device or check USB."
else
echo "Starting..."
sleep 1
clear
echo "Hello, "$(whoami) "on" $(ideviceinfo -k ProductVersion)"!"
sleep 2
sleep 1
echo "Getting device information."
sleep 1
clear
echo "Getting device information.."
sleep 1
clear
echo "Getting device information..."
fi