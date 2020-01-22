echo 'Turning off USB'
echo 0 | sudo tee /sys/devices/platform/soc/3f980000.usb/buspower >/dev/null

#To shut off power on USB ports (this shuts power on ethernet as well):
#echo '1-1' |sudo tee /sys/bus/usb/drivers/usb/unbind

#To turn off separately there is a tool:
#https://github.com/mvp/uhubctl# 
