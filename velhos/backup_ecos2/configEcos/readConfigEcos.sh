#!/bin/bash
echo 'ECOS project: Script that reads configEcos and establish the variables'
#Importing configuration file
echo '#################################################'
echo 'Importing ECOS configuration file: configEcos.ini'
CFG_FILE=configEcos.ini
if [ "$CFG_FILE" ]
then
  echo "Config file found:" $CFG_FILE ""
else
  echo "Ecos Config file  NOT FOUND!!!"
fi
echo " "
echo '#################################################'
echo 'Reading general variables...'
ID=$(awk -F "=" '/id/ {print $2}' "$CFG_FILE")
ETH_IP=$(awk -F "=" '/eth_ip/ {print $2}' "$CFG_FILE")
WIFI_IP=$(awk -F "=" '/wifi_ip/ {print $2}' "$CFG_FILE")

# echo "ID:" $ID ""
# echo "ETH_IP:" $ETH_IP ""
# echo "WIFI_IP:" $WIFI_IP ""
# echo "ECOS_RECORDINGS_FOLDER_NAME:" $ECOS_RECORDINGS_FOLDER_NAME ""
# echo "GPS_LON:" $GPS_LON ""
# echo "GPS_LAT:" $GPS_LAT ""

if [ "$ID" ]
  then
    echo "ID: " $ID ""
  else
    echo "No ID defined"
fi
#Raspberri ethernet: 'eth0'
if [ "$ETH_IP" ]
  then
    echo "Setting IP for ETH0 (Ethernet)" $ETH_IP""
    sudo ifconfig eth0 down
    sudo ifconfig eth0 $ETH_IP
    sudo ifconfig eth0 up
  else
    echo "No ethernet IP defined so it goes to DHCP (assign automatically)"
fi
#Raspberri ethernet: 'wlan0'
if [ "$WIFI_IP" ]
  then
    echo "Setting IP for WLAN0 (Wifi)" $WIFI_IP ""
    sudo ifconfig wlan0 down
    sudo ifconfig wlan0 $WIFI_IP
    sudo ifconfig wlan0 up
  else
    echo "No wifi IP defined so it goes to DHCP (assign automatically)"
fi


echo '#################################################'
echo 'Reading variables to enable or disable devices...'
WIFI_ON=$(awk -F "=" '/wifi_on/ {print $2}' "$CFG_FILE")
LEDS_ON=$(awk -F "=" '/leds_on/ {print $2}' "$CFG_FILE")
HDMI_ON=$(awk -F "=" '/hdmi_on/ {print $2}' "$CFG_FILE")
BLUETOOTH_ON=$(awk -F "=" '/bluetooth_on/ {print $2}' "$CFG_FILE")
USB_ON=$(awk -F "=" '/usb_on/ {print $2}' "$CFG_FILE")
ETHERNET_ON=$(awk -F "=" '/ethernet_on/ {print $2}' "$CFG_FILE")
if [ "$WIFI_ON" ]
  then
    echo "-WIFI_ON:" $WIFI_ON ""
  else
    echo "-No WIFI_ON defined"
fi
if [ "$LEDS_ON" ]
  then
    echo "-LEDS_ON:" $LEDS_ON ""
  else
    echo "-No LEDS_ON defined"
fi
if [ "$HDMI_ON" ]
  then
    echo "-HDMI_ON:" $HDMI_ON ""
  else
    echo "-No HDMI_ON defined"
fi
if [ "$BLUETOOTH_ON" ]
  then
    echo "-BLUETOOTH_ON:" $BLUETOOTH_ON " (Not done yet)"
  else
    echo "-No BLUETOOTH_ON defined"
fi
if [ "$USB_ON" ]
  then
    echo "-USB_ON:" $USB_ON " (This should be 1. If USB_ON=0 SoundCard won't work!!)"
  else
    echo "-No USB_ON defined."
fi
if [ "$ETHERNET_ON" ]
  then
    echo "-ETHERNET_ON:" $ETHERNET_ON ""
  else
    echo "-No ETHERNET_ON defined"
fi
