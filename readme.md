Scripts para uso do Ecos

Exemplos:  

Para copiar todos os arquivos wavs de Grabacoes do Raspberry para o HOME do pc local via SSH:  
scp -r pi@ip.do.raspberry:/home/pi/Documents/Grabacoes/*.wav $HOME  
  
Para copiar todos os arquivos wavs de Grabacoes feitas em fevereiro de 2020 para o HOME do pc local via SSH:  
scp -r pi@ip.do.raspberry:/home/pi/Documents/Grabacoes/ECOS_202002*.wav $HOME
  
  
Referências:  
http://solo-system.github.io/home.html  
https://www.openacousticdevices.info/  

