#!/bin/bash
echo '#################################################'
echo 'ECOS project (enableAllSystems.sh): Enable systems down by reduceConsumption'
CFG_FILE=$1
echo "Importing ECOS configuration file: "$CFG_FILE

if [ "$CFG_FILE" ]
 then
   echo "Config file found:" $CFG_FILE ""
   echo 'Reading variables to enable or disable devices...'
   WIFI_ON=$(awk -F "=" '/wifi_on/ {print $2}' "$CFG_FILE")
    WIFI_ON=$(echo $WIFI_ON | tr -d \;)
    WIFI_ON=$(echo $WIFI_ON | tr -d '[:blank:]')
   LEDS_ON=$(awk -F "=" '/leds_on/ {print $2}' "$CFG_FILE")
    LEDS_ON=$(echo $LEDS_ON | tr -d \;)
    LEDS_ON=$(echo $LEDS_ON | tr -d '[:blank:]')
   HDMI_ON=$(awk -F "=" '/hdmi_on/ {print $2}' "$CFG_FILE")
    HDMI_ON=$(echo $HDMI_ON | tr -d \;)
    HDMI_ON=$(echo $HDMI_ON | tr -d '[:blank:]')
   BLUETOOTH_ON=$(awk -F "=" '/bluetooth_on/ {print $2}' "$CFG_FILE")
    BLUETOOTH_ON=$(echo $BLUETOOTH_ON | tr -d \;)
    BLUETOOTH_ON=$(echo $BLUETOOTH_ON | tr -d '[:blank:]')
   USB_ON=$(awk -F "=" '/usb_on/ {print $2}' "$CFG_FILE")
    USB_ON=$(echo $USB_ON | tr -d \;)
    USB_ON=$(echo $USB_ON | tr -d '[:blank:]')
   ETHERNET_ON=$(awk -F "=" '/ethernet_on/ {print $2}' "$CFG_FILE")
    ETHERNET_ON=$(echo $ETHERNET_ON | tr -d \;)
    ETHERNET_ON=$(echo $ETHERNET_ON | tr -d '[:blank:]')

  #t=$(echo $s | gawk '{print $1 $2}')
 echo "-WIFI_ON:" $WIFI_ON ""
  if [ $WIFI_ON -eq 0 ]
    then
      echo "  Turning ON WIFI"
      source turnOn_wifi.sh
    # else
    #   echo "  WIFI_ON:"$WIFI_ON", keeps enabled"
  fi

  echo "-LEDS_ON:" $LEDS_ON ""
  if [ $LEDS_ON -eq 0 ]
    then
      echo "  Turning ON LEDS"
      source turnOn_leds.sh
    # else
    #   echo "  LEDS_ON:"$LEDS_ON", keeps enabled"
  fi

  echo "-HDMI_ON:" $HDMI_ON ""
  if [ $HDMI_ON -eq 0 ]
    then
      echo "  Turning ON HDMI"
      source turnOn_hdmi.sh
    # else
    #   echo "  HDMI_ON:"$HDMI_ON", keeps enabled"
  fi

  echo "-BLUETOOTH_ON:" $BLUETOOTH_ON " (Not done yet)"
  if [ $BLUETOOTH_ON -eq 0 ]
    then
      echo "  Turning ON BLUETOOTH"
    # else
    #   echo "  BLUETOOTH_ON:"$BLUETOOTH_ON", keeps enabled"
  fi

  echo "-USB_ON:" $USB_ON " (This should be 1. If USB_ON=0 SoundCard won't work!!)"
  if [ $USB_ON -eq 0 ]
    then
      echo "  Turning ON USB"
      #DANGER!! if 0, no device can be connected and ethernet connection migh be lost as well.
      # If turning off no keyboard or mouse will work
      #source turnOn_usb.sh

    # else
    #   echo "  USB_ON:"$USB_ON", keeps enabled"
  fi

  echo "-ETHERNET_ON:" $ETHERNET_ON ""
  if [ $ETHERNET_ON -eq 0 ]
    then
      echo "  Turning ON ETHERNET"
    # else
    #   echo "  ETHERNET_ON:"$ETHERNET_ON", keeps enabled"
  fi
else
  echo "  Ecos Config file  NOT FOUND!!!"
fi
