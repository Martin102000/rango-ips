#!/bin/bash

while :; do
clear
nums=$(seq 100 299 | tr -s '\n' '|')
nums+=$(seq -s"|" 400 499)
a=$(echo -e "\e[01;37mDeseja usar DOMÍNO proprio? [S/N]: \e[0m")

echo -e "\e[01;33mATENÇÃO FERRAMENTA APENAS PARA PROFISSIONAIS \e[0m☠\n\n\e[02mEssa ferramenta irá testar\no PROXY ou lista de PROXYS\nUtilize com dados móveis\nsem créditos/franquia! \n\nIP único use: 104.16.18.94\nlistas use: IP,IP,IP,etc...\nPorta única use: 80 ou 443 etc\nlistas use: 80,443,8080,etc...\e[0m\n"

echo -e "\e[01;37mColoque o IP/Proxys que deseja utilizar\e[0m"
 read -p "IP/Proxys: " IP
echo -e "\e[01;37mColoque a PORTA que deseja utilizar\e[0m"
 read -p "Porta(s): " PORTA
read -n1 -p "$a" proprio
case $proprio in
     s|S) echo -e "\n\e[01;37mColoque o seu DOMÍNIO\e[0m"
          read -p "Domínio: " DOMINIO
          ;;
     n|N) dominios="sg.serverkit.me 
                    in.serverkit.me
                    in.serverkit.me
                    us.hostkit.xyz
                    ca.serverkit.me
                    uk.serverkit.me
                    de.serverkit.me
                    us.serverkit.me
                    us1.ws.hostname.cc
                    de1.ws.hostname.cc
                    id1.ws.hostname.cc
                    id2.ws.hostname.cc
                    sg1.ws.hostname.cc"
          dominios2="$((RANDOM%$(wc -l <<< "$dominios")+1))"
          DOMINIO=$(sed -n "$dominios2"p <<< $(tr -d ' ' <<< "$dominios"))
esac; echo; echo

ips=$(grep -o ',' <<< "$IP" | echo $(($(wc -l)+1)))
portas=$(grep -o ',' <<< "$PORTA" | echo $(($(wc -l)+1)))

 for i in $(seq "$portas"); do
  porta=$(cut -d ',' -f$i <<< "$PORTA")
  case $porta in 80) time=3;; 443) time=5;; *) time=4; esac
      for i in $(seq "$ips"); do
       ip=$(cut -d ',' -f$i <<< "$IP")
          try=$(curl -m 5 -s -o /dev/null -w "%{http_code}" $DOMINIO -H "Upgrade: websocket" -x $ip:$porta)
            eval "case $try in
                 $nums\ )
                      echo -e \"\e[01;33m$ip:$porta\e[0m | \e[01;37mIP OK - STATUS $try\e[0m\"
                      echo \"$ip:$porta|$try\" >> OK.txt;;
                   *)
                      echo -e \"$ip:$porta | \e[01;33mSTATUS $try\e[0m\"
            esac"
      done; echo
 done; echo ====================== >> OK.txt
echo -e "\e[01;37m Deseja fazer um novo teste?\n\e[0m    [1] \e[0m\e[01;37mSIM\e[0m | [2] \e[0m\e[01;37mNÃO\e[0m"
 while :; do
  read -n1 -p ": " OPC
   case $OPC in
        1) break;;
        2) exit;;
        *)
   esac
  done
 done
