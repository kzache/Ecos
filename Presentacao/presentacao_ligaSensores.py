
import RPi.GPIO as GPIO    #Importamos la libreria GPIO
import time                #Importamos time
from time import gmtime, strftime, sleep

import Adafruit_DHT #Sensor temp e umidade
import sys, subprocess
#Configuramos los pines GPIO como BCM: The GPIO.BOARD option specifies that you are referring to the pins by the number of the pin the the plug - i.e the numbers printed on the board (e.g. P1) and in the middle of the diagrams below.
#The GPIO.BCM option means that you are referring to the pins by the "Broadcom SOC channel" number, these are the numbers after "GPIO" in the green rectangles around the outside of the below diagrams:
GPIO.setmode(GPIO.BCM)

#CONFIGURATION OF SENSORS:
#############################################################3
# 1) SENSOR PRESENCIA IR ()
PIR_PIN = 7                        #Usaremos el pin GPIO nº7
GPIO.setup(PIR_PIN, GPIO.IN)       #Lo configuramos como entrada
#############################################################3
#2) SENSOR temperature e UMIDADE
# Sensor should be set to Adafruit_DHT.DHT11,
# Adafruit_DHT.DHT22, or Adafruit_DHT.AM2302.
sensor = Adafruit_DHT.AM2302
# Example using a Beaglebone Black with DHT sensor
# connected to pin P8_11.
TEMP_UMI_PIN = 22
timeGapToReadSensor=10#1800 #30 minutes to read umidade y temperature
#############################################################3
#3) SENSOR ULTRASOUND
TRIG_PIN = 23
ECHO_PIN = 24
GPIO.setup(TRIG_PIN,GPIO.OUT)
GPIO.setup(ECHO_PIN,GPIO.IN)
minDistance = 0 #Minima distancia para fazer a foto
maxDistance = 3000 #Minima distancia para fazer a foto
temUmi_medidaFeita = 0

##############################################################
timeStartFile = strftime("%Y%m%d_%H%M%S", gmtime())
fileName="ECO_DATA_" + timeStartFile + ".csv"
startTimeScript=time.time()
#TIME TO CLOSE THE FILE (DANGER!) - parametro al llamar al script
#timeGettingData = int(sys.argv[0])
timeGettingData = 0
elapsed_time_total = 0
try:
    f = open (fileName,'w')
    start_time=time.time() #Sensor tem y umidade
    while True:  #Iniciamos un bucle infinito


        #SENSOR temp e UMIDADE
        elapsed_time=time.time()-start_time;
        if elapsed_time >= timeGapToReadSensor:
            start_time=time.time()
            # Try to grab a sensor reading.  Use the read_retry method which will retry up
            # to 15 times to get a sensor reading (waiting 2 seconds between each retry).
            humidity, temperature = Adafruit_DHT.read_retry(sensor, TEMP_UMI_PIN)
            # Note that sometimes you won't get a reading and
            # the results will be null (because Linux can't
            # guarantee the timing of calls to read the sensor).
            # If this happens try again!
            if humidity is not None and temperature is not None:
                print('Temp={0:0.1f}*C  Humidity={1:0.1f}%'.format(temperature, humidity))
                timeLog = strftime("%Y-%m-%d_%H:%M:%S", gmtime())
                f.write(timeLog + ";T:;"+ str(temperature) + ";H:;"+str(humidity) + "\n")
            else:
                timeLog = strftime("%Y-%m-%d_%H:%M:%S", gmtime())
                f.write(timeLog + ";T:;-1;H:;-1;"+ ";Failed to get reading." + "\n")
                print('Failed to get reading. Try again!')
       

        #SENSOR ultrasom
        #print ("Starting ultrasound measurement")
        GPIO.output(TRIG_PIN, False)
        #print ("Waiting For Sensor To Settle")
        time.sleep(0.5)
        GPIO.output(TRIG_PIN, True)
        time.sleep(0.00001)
        GPIO.output(TRIG_PIN, False)
        while GPIO.input(ECHO_PIN)==0:
            pulse_start = time.time()
        while GPIO.input(ECHO_PIN)==1:
            pulse_end = time.time()
        pulse_duration = pulse_end - pulse_start
        distance = pulse_duration * 17150
        distance = round(distance, 2)
        print ("Distance:", distance,"cm")
       
        
        #Fechar o arquivo quando acaba o tempo de grabaçao
        elapsed_time_total = time.time()-startTimeScript;
        if timeGettingData != 0:
            if elapsed_time_total>=timeGettingData:
                f.close()
                print ("quit")            #Anunciamos que finalizamos el script
                GPIO.cleanup()          #Limpiamos los pines GPIO y salimos


#         #SENSOR PRESENCIA
#         if GPIO.input(PIR_PIN):  #Si hay señal en el pin GPIO nº7
# #           GPIO.output(17,True) #Encendemos el led
#             time.sleep(1)        #Pausa de 1 segundo
#             timex = strftime("%d-%m-%Y %H:%M:%S", gmtime()) #Creamos una cadena de texto con la hora
#             print(timex + " MOVIMIENTO DETECTADO")  #La sacamos por pantalla
#             time.sleep(1)  #Pausa de 1 segundo
# #           GPIO.output(17,False)  #Apagamos el led
#         else:
#             print("NO movimiento")
#         time.sleep(1)              #Pausa de 1 segundo y vuelta a empezar
except KeyboardInterrupt:   #Si el usuario pulsa CONTROL + C...
    print ("quit")            #Anunciamos que finalizamos el script
    GPIO.cleanup()          #Limpiamos los pines GPIO y salimos
