#!bin/bash
clear 
while :
do
#menu banner
clear
echo -e "\e[1;33m(98/8)\e[1;32m" 
echo "    __  __           __     ______     __                  __             "
echo "   / / / /___  _____/ /_   / ____/  __/ /__________  _____/ /_____  _____ "
echo "  / /_/ / __ \/ ___/ __/  / __/ | |/_/ __/ ___/ __ \/ ___/ __/ __ \/ ___/ "
echo " / __  / /_/ (__  ) /_   / /____>  </ /_/ /  / /_/ / /__/ /_/ /_/ / /     "
echo "/_/ /_/\____/____/\__/  /_____/_/|_|\__/_/   \__,_/\___/\__/\____/_/      "
echo -e "\e[1;33mV= 1.0" 
echo "" 
echo -e "\e[1;31m[1]\e[1;32m SCRIPT A USAR"
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
