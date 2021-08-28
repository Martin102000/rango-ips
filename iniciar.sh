#!/bin/bash

clear
nums=$(seq 100 299 | tr -s '\n' '|')
nums+=$(seq -s"|" 400 499)

echo -e "\e[01;33mATENCION, HERRAMIENTA PARA HACKERS \e[0m☠\n\n\e[02meEsta herramienta hara solicitudes\npara un dominio especifico\nutilizando un rango de ip\nUtiliza el 4G sin saldo.\n\nFormato  del proxy: 10.10. o 10.10.10.\nSe haran muchas solicitudes\nagregando de 0 a 255\e[0m\n"; sleep 1

while :; do
echo -e "\e[01;37mColoque la IP/Proxy que desea utilizar\e[0m"
read -p "IP/Proxy: " IP
echo -e "\e[01;37mColoque el puerto a probar (Python/Stunnel)\e[0m"
read -p "IP/Proxy: " PORTA
echo -e "\e[01;37mColoque su dominio\e[0m"
read -p "Domínio: " DOMINIO

dots=$(fgrep "." -o <<< $IP | wc -l)
> ips.txt; echo "Creditos a @EhisOpeNer y a @alekc_2000 por la traduccion" > a; > b
case $dots in
  1) echo -e "\e[01;33mAmigo... 3 puntos en ip, va a demorar como un diablo...\e[0m\n"; sleep 1
     #  ESSE DEMORARIA PRA UM DIABO
     ;;                                                    
  2) ips=$(for i in {0..255}; do echo $IP$i.; done)
      for i in {0..255}; do                             
         case $i in 0) i=1; esac                        
         ips2=$(sed -n "$i"p <<< "$ips");
            for i1 in {0..255}; do
                echo $ips2$i1 >> ips.txt
            done
      done
      echo -e "\n\e[01;33mCasi 65536 IPs fueron generados\nLas solicitudes seran procesadas en shell.\e[0m\n\e[02m(PUEDE TARDAR...)\e[0m\n"
       x=$(($(wc -l < ips.txt)/3))

         $(for i in $(seq $x); do ip=$(sed -n "$i"p ips.txt); try=$(curl -m 3 -s -o /dev/null -w "%{http_code}" $DOMINIO -H "Upgrade: websocket" -x $ip:$PORTA); eval "case $try in $nums\ ) echo \"$ip|$try\" >> OK.txt; echo \"\e[01;33m$ip\e[0m | \e[01;37mIP OK - STATUS $try\e[0m\" >> ips2.txt; echo \"Creditos a @EhisOpeNer y a @alekc_2000 por la traduccion\" >> a;; *):; esac"; done; echo a >> b) </dev/null >/dev/null 2>&1&

         $(for i in $(seq $(($x+1)) $(($x*2))); do ip=$(sed -n "$i"p ips.txt); try=$(curl -m 3 -s -o /dev/null -w "%{http_code}" $DOMINIO -H "Upgrade: websocket" -x $ip:$PORTA); eval "case $try in $nums\ ) echo \"$ip|$try\" >> OK.txt; echo \"\e[01;33m$ip\e[0m | \e[01;37mIP OK - STATUS $try\e[0m\" >> ips2.txt; echo \"Creditos a @EhisOpeNer y a @alekc_2000 por la traduccion\" >> a;; *):; esac"; done; echo a >> b) </dev/null >/dev/null 2>&1&

         $(for i in $(seq $(($x*2+1)) $(wc -l < ips.txt)); do ip=$(sed -n "$i"p ips.txt); try=$(curl -m 3 -s -o /dev/null -w "%{http_code}" $DOMINIO -H "Upgrade: websocket" -x $ip:$PORTA); eval "case $try in $nums\ ) echo \"$ip|$try\" >> OK.txt; echo \"\e[01;33m$ip\e[0m | \e[01;37mIP OK - STATUS $try\e[0m\" >> ips2.txt; echo \"Creditos a @EhisOpeNer y a @alekc_2000 por la traduccion\" >> a;; *):; esac"; done; echo a >> b) </dev/null >/dev/null 2>&1&
      
      while :; do
       linhas=$(wc -l < a)
         case $linhas in
              1) echo -e "\e[01;33m BUSCANDO IP CON RETORNO OK...\e[0m"| pv -qL 10; sleep 5; tput cuu1; tput dl1;
                 linhas=$(wc -l < b)
                  case $linhas in
                      3) echo -e "\e[01;37m NINGUNA IP FUE VALIDA :( \e[0m"| pv -qL 10; sleep 3; break
                  esac;;
              *) linhas=$(wc -l < b)
                  case $linhas in
                      3) break;
                  esac
                 echo -e "\e[01;37m ALGUNAS IP DARAN OK..\e[0m"| pv -qL 10; sleep 5; tput cuu1; tput dl1;;
         esac
      done

      linhas=$(wc -l < a)
        case $linhas in
             1) echo -e "\e[01;33m NO HUBO NINGUN RETORNO OK EN ESE RANGO DE IPs $IP\255.255\e[0m"; break;;
             *) linhas=$(wc -l < b)
                OK=$(<ips2.txt)
                echo -e "$OK"; break
         esac
     ;;
  3) for i in {0..255}; do echo $IP$i >> ips.txt; done
      for i in $(seq $(wc -l < ips.txt)); do
         ip=$(sed -n "$i"p ips.txt)
         try=$(curl -m 3 -s -o /dev/null -w "%{http_code}" $DOMINIO -H "Upgrade: websocket" -x $ip:$PORTA)
          eval "case $try in
                 $nums\ )
                      echo -e \"\e[01;33m$ip\e[0m | \e[01;37mIP OK - STATUS $try\e[0m\"
                      echo \"$ip|$try\" >> OK.txt;;
                   *)
                      echo -e \"$ip | \e[01;33mSTATUS $try\e[0m\"
           esac"
      done; echo ================= >> OK.txt; break
     ;;
  *) echo -e "\e[01;31mIngrese el formato correctamente\e[0m\n"; sleep 1
esac
done; rm ips.txt ips2.txt b a 2> /dev/null
