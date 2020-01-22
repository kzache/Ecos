#!/bin/bash
echo 'ECOS project'
echo 'This script will enable all systems in Rasp Pi 3 (USB, WIFI, HDMi...) after consumption reduction protocol'
source turnOn_hdmi.sh
source turnOn_wifi.sh
source turnOn_leds.sh
#DANGER: if usb is turned off the sound card won't work!!! (neither kwyboard or mouse)
#source turnOn_usb.sh
echo 'Ethernet should be still ON'
exit
