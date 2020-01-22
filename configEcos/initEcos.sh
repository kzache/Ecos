#!/bin/bash
echo '#################################################'
echo 'ECOS project (initEcos.sh)'
CFG_FILE=configEcos.ini
if [ "$CFG_FILE" ]
then
  echo "Config file found:" $CFG_FILE ""
else
  echo "Ecos Config file  NOT FOUND!!!"
fi

#Importing configuration file
echo 'Importing ECOS configuration file...'
cd $HOME/scriptsEcos/configEcos
source readConfigEcos.sh $CFG_FILE


#Delay de 10 minutos = 600 segundos
echo 'Before switching off devices, there are 5 minutes with everything working (for security reasons)'
sleep 60
#Call the script to reduce energy
echo "Calling the reduce Consumption protocol"
source reduceConsumption.sh $CFG_FILE


#Enable all systems again
echo "For security reasons while testing, in 5 minutes the whole system will be up again"
sleep 36000
source enableAllSystems.sh $CFG_FILE

#This should be the only exit of the systen
exit
