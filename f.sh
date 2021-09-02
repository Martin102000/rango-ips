#!/bin/bash
clear
Menu() {
    clear
    echo -e '\n'
    echo -e " \e[01;31m==========================\e[0m"
    echo -e " \e[05;33mCloudfare \e[0m\e[05;32m@EhisOpeNer & @alekc_2000\e[0m"  
    echo -e " \e[05;36mA encontrar host se dijo\e[0m"	
    echo -e " \e[05;32m__________________________\e[0m"
    echo -e " \e[01;36m[  1 ] | \e[0m\e[01;33mTestear Proxys\e[0m"
    echo -e " \e[01;36m[  2 ] | \e[0m\e[01;33mVerificar IPs Free Cloudfare\e[0m"
    echo -e " \e[01;36m[  3 ] | \e[0m\e[01;33mVerificar Hosts con subdomínios Cloudfare\e[0m"
    echo -e " \e[01;36m[  0 ] | \e[0m\e[01;31mSAIR, TENGO MIEDO\e[0m"
    echo -e '\n'
    echo -e " \e[00;31m═══════════════════════════════\e[0m"
    echo 
    echo -e "   \e[05;35mElije una opcion\e[05m"
    read -n1 -p "$opc1" opc
   case $opc in
    1) git clone https://github.com/leitura/testproxy.git; cd testproxy && chmod +x scan && ./scan ; sleep 2 ; clear ; exit ;;
    2) curl -sO https://raw.githubusercontent.com/Martin102000/rango-ips/main/privado.sh; chmod +x privado.sh && ./privado.sh ; sleep 2 ; clear ; exit ;;
    3) curl -sO https://raw.githubusercontent.com/Martin102000/rango-ips/main/subdomainCDN.sh; chmod +x subdomainCDN.sh && ./subdomainCDN.sh ; sleep 2 ; clear ; exit ;;
0) clear ; exit ;;
    *) echo "Calma mariposa" ; sleep 1 ; Menu ;;
    esac
    connect
    }

connect () {
clear
check1() {
    vpn=$(ifconfig | grep -c tun0)
    case $vpn in
    1) clear ; echo "VPN Conectada" ; echo ; echo "Desconectate de cualquier vpn" ; echo "No sabes desconectar?" ; echo "sos un boludo" ; echo "cerra la aplicacion vpn" ; echo ; echo "y recien podras." ; sleep 2 ; check1 ;;
    0) clear 
    esac
}
check1
check2() {
    vpn=$(ifconfig | grep -c tun0)
    case $vpn in
    1) clear ; echo "Desconecta cualquier vpn" ; echo "...." ; echo "----" ; echo ; echo "---?" ; sleep 1 ; check2 ;;
    esac
}
check2
}
clear
Menu
