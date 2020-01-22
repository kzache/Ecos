echo "Empezando SOUND"
current_time=$(date "+%Y_%m_%d-%H_%M_%S")
path="/home/pi/Documents/Grabacoes/ECOS_interactivos_"
extension=".wav"
file_name=$path$current_time
echo "Current time : $current_time"
echo "File name: " "$file_name" 
arecord -D hw:0,0 -d $1 -f cd -c 2 $file_name$extension


#echo "Empezando VIDEO"
#file_name1=/home/pi/Documents/image.jpeg
#current_time1=$(date "+%Y_%m_%d-%H_%M_%S")
#extension1=".jpg"
#new_filename1=$path$current_time1
#cp $file_name1 $new_filename1
#echo "Vc deveria ver o novo arquivo gerado com timestamp sobre ele.."
#raspistill -v -o $new_filename1$extension1
