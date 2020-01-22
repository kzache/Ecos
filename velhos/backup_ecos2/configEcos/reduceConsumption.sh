#!/bin/bash
echo 'ECOS project'
echo 'Consumption reduction protocol'
source turnOff_hdmi.sh
#source turnOff_wifi.sh
source turnOff_leds.sh

#DANGER: if usb is turned off the sound card won't work!!! (neither kwyboard or mouse)
#source turnOff_usb.sh
echo 'Ethernet keeps ON'
exit
