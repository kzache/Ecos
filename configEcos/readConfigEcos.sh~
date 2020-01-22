#!/bin/bash
echo '#################################################'
echo 'ECOS project (readConfigEcos.sh): Script that reads configEcos and establish the variables'
#Importing configuration file
echo 'Importing ECOS configuration file: configEcos.ini'
CFG_FILE=$1
if [ "$CFG_FILE" ]
then
  echo "Config file found:" $CFG_FILE ""
else
  echo "Ecos Config file  NOT FOUND!!!"
fi
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
