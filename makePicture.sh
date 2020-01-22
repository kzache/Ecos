echo "Starting ECOS make picture program"

cd ~
CFG_FILE1=./scriptsEcos/configEcos/configEcos.ini
echo "1. Importing ECOS configuration file: "$CFG_FILE1
echo "2. Configuring path to place file...: "
#path="/home/pi/Documents/Grabacoes/ECOS_interactivos_"
path1="$HOME/Documents/Grabacoes/"
echo "  Basic path: "$path1

if [ "$CFG_FILE1" ]
 then
  echo "  Config file found:" $CFG_FILE1 ""
  ECOS_RECORDINGS_FOLDER_NAME1=$(awk -F "=" '/ecos_recordings_folder_name/ {print $2}' "$CFG_FILE")
  if [ "$ECOS_RECORDINGS_FOLDER_NAME1" ]
    then
      echo "  Project Folder:" $ECOS_RECORDINGS_FOLDER_NAME1 ""
      cd $path1
      #mkdir $ECOS_RECORDINGS_FOLDER_NAME1
      path=$path1$ECOS_RECORDINGS_FOLDER_NAME1
      path=$path1"/ECOS_"
      cd ~
    else
      echo ""
  fi
else
  echo "  Ecos Config file  NOT FOUND!!!"
fi

echo "  Complete path: "$path1
#current_time1=$(date "+%Y%m%d-%H%M%S")
current_time1=$1
echo "  Current time : $current_time1"
file_name1=$path1$current_time1
extension1=".jpg"
#Command to make the picture
raspistill -v -o $file_name1$extension1
