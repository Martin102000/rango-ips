#!/bin/bash

clear
nums=$(seq 100 299 | tr -s '\n' '|')
nums+=$(seq -s"|" 400 499)

echo -e "\e[01;33mSCRIPT REALIZADA 100% POR ALEJANDRO"; sleep 1

while :; do
echo -e "\e[01;37mNombre del archivo txt a usar:\e[0m"
read -p "IP/Proxy: " IP
dominios.txt; echo "Creditos @alekc_2000" > a; > b
         ip=$(sed -n "$i"p dominios.txt)
         try=$(curl -m 3 -s -o /dev/null -w "%{http_code}" datacenter.vps-ssl.xyz -H "Upgrade: websocket" -x https://$ip:443)
          eval "case $try in
                 $nums\ )
                      echo -e \"\e[01;33m$ip\e[0m | \e[01;37mIP OK - STATUS $try\e[0m\"
                      echo \"$ip|$try\" >> OK.txt;;
                   *)
                      echo -e \"$ip | \e[01;33mSTATUS $try\e[0m\"
           esac"
      done; echo ================= >> OK.txt; break
