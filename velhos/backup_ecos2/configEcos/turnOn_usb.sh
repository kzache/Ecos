echo 'Turning on USB'
echo 1 | sudo tee /sys/devices/platform/soc/3f980000.usb/buspower >/dev/null
#To turn power back on (USB + ethernet)
