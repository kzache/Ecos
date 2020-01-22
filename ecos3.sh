# Notas dia 14/08/2019 por Aluizio Neto:
# Comentado código para imprimir nome completo do arquivo de gravação
# Adicionado código para segmentação do arquivo de gravação usando 
# segundo argumento como duração

# ecos3.sh duration segmentSize
#
# Parameters:
# 	duration - overall recording time in seconds
#	segmentSize - lenght of segments in seconds after spliting file
#


echo "Starting ECOS recording program"

cd ~
CFG_FILE=./scriptsEcos/configEcos/configEcos.ini
echo "1. Importing ECOS configuration file: "$CFG_FILE
echo "2. Configuring path to place file...: "
#path="/home/pi/Documents/Grabacoes/ECOS_interactivos_"
path="/home/pi/Documents/Grabacoes/"
gps_coord=
echo "  Basic path: "$path
if [ "$CFG_FILE" ]
 then
  echo "  Config file found:" $CFG_FILE ""
  ECOS_RECORDINGS_FOLDER_NAME=$(awk -F "=" '/ecos_recordings_folder_name/ {print $2}' "$CFG_FILE")
  GPS_LAT=$(awk -F "=" '/gps_lat/ {print $2}' "$CFG_FILE")
  GPS_LON=$(awk -F "=" '/gps_lon/ {print $2}' "$CFG_FILE")


  if [ "$ECOS_RECORDINGS_FOLDER_NAME" ]
    then
      echo "  Project Folder:" $ECOS_RECORDINGS_FOLDER_NAME ""
      cd $path
      mkdir $ECOS_RECORDINGS_FOLDER_NAME
      path=$path$ECOS_RECORDINGS_FOLDER_NAME
      path=$path"/ECOS_"
      cd ~
    else
      echo ""
  fi
  if [ "$GPS_LAT" ]
    then
      echo "  GPS Longitude:" $GPS_LAT ""
      gps_coord="_GPS_"$GPS_LAT
    else
      echo "  No GPS Latitude defined"
  fi
  if [ "$GPS_LON" ]
    then
      echo "  GPS Longitude:" $GPS_LON ""
      gps_coord=$gps_coord"_"
      gps_coord=$gps_coord$GPS_LON
      # gps_coord=$gps_coord
    else
      echo "  No GPS Longitude defined"
  fi

else
  echo "  Ecos Config file  NOT FOUND!!!"
fi
echo "  Complete path: "$path
current_time=$(date "+%Y%m%d-%H%M%S")
current_time="ECOS_"$current_time
echo "  Current time : $current_time"
file_name=$path$current_time
if [ "$gps_coord" ]
  then file_name=$file_name$gps_coord
fi
extension=".wav"
#file_name=$file_name$extension // Comentado por Aluizio em 14/08 (segmentador nome sem extensão)
echo "  File name: " "$file_name$extension"
echo "3. Starting recording for "$1" seconds."

arecord -D hw:0,0 -d $1 -f cd -c 2 $file_name$extension

echo  "Split files in "$2" second segments"
ffmpeg -i $file_name$extension -f segment -segment_time $2 -c copy $file_name".%03d"$extension


#echo "Empezando VIDEO"
#file_name1=/home/pi/Documents/image.jpeg
#current_time1=$(date "+%Y_%m_%d-%H_%M_%S")
#extension1=".jpg"
#new_filename1=$path$current_time1
#cp $file_name1 $new_filename1
#echo "Vc deveria ver o novo arquivo gerado com timestamp sobre ele.."
#raspistill -v -o $new_filename1$extension1
