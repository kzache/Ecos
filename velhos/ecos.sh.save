echo "Empezando SOUND"

file_name=/home/pi/Documents/test.wav
current_time=$(date "+%Y_%m_%d-%H_%M_%S.wav")
echo "Current time : $current_time"
new_filename=$file_name.$current_time
echo "New FileName: " " $new_filename"
cp $file_name $new_filename

#arecord /home/pi/Documents/test.wav
arecord -D hw:1,0 -d 120 -f cd /home/pi/Documents/test.wav -c 2

echo "Empezando VIDEO"

file_name1=/home/pi/Documents/image.jpeg
current_time1=$(date "+%Y_%m_%d-%H_%M_%S.jpeg")
new_filename1=$file_name1.$current_time1
cp $file_name1 $new_filename1

echo "Vc deveria ver o novo arquivo gerado com timestamp sobre ele.."

raspistill -v -o /home/pi/Documents/image.jpeg
