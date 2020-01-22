#!/bin/bash
echo 'ECOS project init file (executed from /etc/init.d)'

#Importing configuration file
#echo 'Importing ECOS configuration file: configEcos.ini'
cd /home/pi/scriptsEcos/configEcos
#source configEcos.ini

#Delay de 10 minutos = 600 segundos
echo 'Before switching off devices, there are 5 minutes with everything working (for security reasons)'
sleep 180
#Call the script to reduce energy
echo "Calling the reduce Consumption protocol"
#source /home/pi/scriptsEcos/configEcos/reduceConsumption.sh
source reduceConsumption.sh

#Enable all systems again
echo "For security reasons while testing, in 5 minutes the whole system will be up again"
sleep 180
#source /home/pi/scriptsEcos/configEcos/enableAllSystems.sh
source enableAllSystems.sh


#This should be the only exit of the systen
exit

