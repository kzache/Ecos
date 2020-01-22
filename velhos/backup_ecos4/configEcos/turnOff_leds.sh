echo 'Turning off PWR Led (red)'
sudo sh -c 'echo 0 > /sys/class/leds/led1/brightness'
echo 'Turning off activity led (green)'
sudo sh -c 'echo 0 > /sys/class/leds/led0/brightness'
