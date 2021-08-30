#!bin/bash
#Created: 13/11/2018
#Upgrade 12/01/2019
#by: real strategy
#Successful update
#MESSAGE: Never stop learning, if you are here is out of curiosity and try to learn shell or bash with the help of google search among others and so you will have more ease of course take time but you will learn even if editing
clear
while :
do
#menu banner
clear
echo -e "\e[1;33m(98/8)\e[1;32m"

echo "      __      ___       _______  "
echo "     /  \    |   |     /       | "
echo "    /    \   ||  |    (: ______) "
echo "   /' /\  \  |:  |     \/    |   "
echo "  //  __'  \  \  |___  // ___)_  "
echo " /   /  \\  \( \_|:  \(:       | "
echo "(___/    \___)\_______)\_______) "
echo "script realizada por @alekc_2000"
echo -e "\e[1;31m[1]\e[1;32m BUSCADOR DE SUBDOMINIOS"
echo -e "\e[1;31m[2]\e[1;32m PROBAR SUBDOMINIOS DOMINIOS.TXT"
echo -e "\e[1;31m[3]\e[1;32m INSTALAR SUBLIST3R Y SCRIPT CLOUD (PRIMER PASO)"
echo -e "\e[1;31m[4]\e[1;32m BUSCAR IP HOST CLOUDFLARE"
echo ""
echo -e "\e[1;36m"
echo -n "Choose option: "
read opcion
#lista de menu
echo -e "\e[0m"
case $opcion in
1)echo ""
echo -n "HOST: ";
read HOST;
python sublist3r.py -d $HOST -p 80,443 -o dominios.txt
echo ""
echo -e "\e[0m";
echo -e "\e[1;31mpresiona enter para volver al script..!\e[0m";
read foo
;;
2)echo ""
echo "Probando y analizando subdominios en el archivo dominios.txt...";
echo ""
while read LINE; do
curl -m 3 -s -o /dev/null -w "%{http_code}" datacenter.vps-ssl.xyz -I -H "Upgrade: websocket" -x https://$(cat dominios.txt):443 | grep HTTP
  echo ' '$LINE
done < dominios.txt
echo ""
echo -e "\e[1;31mpresiona enter para volver al script...\e[0m"
read foo
;;
3)echo ""
echo -e "\e[1;33mBAJANDO SUBLIST3R\e[0m";
pkg install git && pkg install python && pip install requests && pip install dnspython && pip install argparse
wget https://raw.githubusercontent.com/Martin102000/rango-ips/main/privado.sh
wget https://raw.githubusercontent.com/aboul3la/Sublist3r/master/sublist3r.py
wget https://raw.githubusercontent.com/aboul3la/Sublist3r/master/sublist3r.py
mkdir subbrute
cd subbrute 
wget https://raw.githubusercontent.com/aboul3la/Sublist3r/master/subbrute/names.txt
wget https://raw.githubusercontent.com/aboul3la/Sublist3r/master/subbrute/resolvers.txt
wget https://raw.githubusercontent.com/aboul3la/Sublist3r/master/subbrute/subbrute.py
;;
4)echo ""
chmod 777 privado.sh
bash privado.sh
;;
5)echo ""
echo -ne "\e[1;31m DOMAIN(IP/WEB): ";
read MAIN
echo -ne "\e[1;31m PORTS(53,80):  ";
read RTS
sleep 2
echo -e "\e[1;32m";
nmap -p $RTS $MAIN
read foo
;;
6)echo -ne "\e[1;31mSITE WEB/IP: ";
read WEB
echo ""
echo -e "\e[1;32m"
curl https://api.hackertarget.com/geoip/?q=$WEB
read foo
;;
7)clear
echo -e "\e[1;32mRead everything for the proper use of the tool...";
sleep 2.5
cat manualEN.txt
read foo
;;
12.25)clear
echo -e "\e[1;32mEntering the secret menu...";
sleep 2
bash ._
read foo
;;
8)echo ""
echo -e "\e[1;33mCREDITS TO THE DEVELOPER\e[0m"
echo ""
echo -e "\e[1;31mCoder: @RealStrategy y el grupo vip RS"
echo -e "\e[1;32m"
echo "YOUTUBE : https://youtube.com/RealHackRWAM "
echo "TELEGRAM: https://t.me/RealHackRWAM "
echo "TELEGRAM: https://t.me/RealStrategyRS "
echo "FACEBOOK: https://m.facebook.com/groups/142565756559228 "
echo "FACEBOOK: https://m.facebook.com/RealHackRWAM "
echo ""
echo -e "\e[1;31mMESSAJE FROM RS\e[0m"
echo ""
echo -e "\e[1;36mNever stop learning... :)\e[0m"
echo ""
read foo;
;;
98)clear
echo "translating to english language...";
sleep 3
bash real-host-v2.sh
;;
99)clear
echo "Translating to spanish language...";
sleep  3
bash .real-host.sh
;;
#Fin del menu/in the end
0)clear
exit 0;;
#error
*)clear
echo "Invalid command...";
sleep 1.5
;;
esac
done
