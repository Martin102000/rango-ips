#!/bin/bash

while :; do
clear; rm csrf 2> /dev/null

if [ -f OK.txt ]; then :; else echo -e "$(printf '=%.0s' {1..19})\n IPs CloudFlare|ON\n$(printf '=%.0s' {1..19})" >> OK.txt; > OK2.txt; fi

echo -e "\e[01;33mATENCIÓN HERRAMIENTA PARA PROFESIONALES\e[0m☠\n\n\e[02mesta herramienta verificara si el\nHOST utiliza proxy/CDN(CloudFlare)\nutiliza el script con INTERNET!\n\n*NO PONGAS TU SUB DE CLOUDFLARE! ESE NO ES...\n*Por Ej: personal.com.ar o claro.com.ar etc\e[0m\n"

data=$(curl -s https://subdomainfinder.c99.nl/index.php --compressed | pup 'input' | grep hidden | cut -d '"' -f4,6)
 data2=$(($(wc -l <<< "$data")-2))
  data3=$(head -n "$data2" <<< "$data" | tr -s "\n" "&" | tr -s '"' '=' | sed -r 's/.$//g')

path=$(curl -s https://subdomainfinder.c99.nl/js/nginx_v37728122119.js)
 path2=$(cut -d '"' -f2 <<< "$path")
  path3=$(cut -d '(' -f11 <<< "$path" | cut -d ' ' -f4 | cut -d '.' -f2)
   path4=$(curl -s https://subdomainfinder.c99.nl$path2 | grep "$path3.........." -o | cut -d ':' -f2 | cut -d ',' -f1)

quant=$(($(grep "&" -o <<< "$data3" | wc -l)+1))
csrf=$(cut -d '&' -f$quant <<< "$data3" | cut -d '=' -f1)
 csrf2=$(curl -s https://raw.githubusercontent.com/leitura/subdomainCDN/main/csrf)
ok=$(eval "sed \"s/$csrf/$csrf2/\" <<< \"$data3\"")

echo -e "\e[01;37m Coloque o HOST para verificação\e[0m"
read -p "Host: " HOST

OKK=$(curl -s https://subdomainfinder.c99.nl/index.php -H "content-type: application/x-www-form-urlencoded" -H "origin: https://subdomainfinder.c99.nl" -H "referer: https://subdomainfinder.c99.nl/index.php" -H "user-agent: Android" -d "$ok&jn=JS+aan%2C+T+aangeroepen%2C+CSRF+aangepast&domain=$HOST&lol-stop-reverse-engineering-my-source-and-buy-an-api-key=60ade41f4d4e5a01562f2baf8e8058b9038af54d&scan_subdomains=" --compressed)
OK=$(pup 'tbody' <<< "$OKK")

teste=$(grep "CSRF token invalid or expired" -c <<< "$OKK")
 case $teste in
      1) echo -e "\n \e[01;37;41m O CSRF RETORNOU INVÁLIDO \e[0m\n\e[02m caso seja problema relacionado ao webtool\n aguarde por uma possível solução\n se não apenas tente novamente\e[0m"; eita=1; sleep 2.5;;
      *)
 esac

ok2=$(cat -n <<< "$OK" | grep "CloudFlare is" | awk '{$1=$1};1' | cut -d ' ' -f1)
linhas=$(wc -l <<< "$ok2")
echo
for i in $(seq "$linhas"); do
      q=$(sed -n "$i"p <<< "$ok2")
      w=$(sed -n "$q"p <<< "$OK" | egrep 'on|off' -o | head -n1)
       case $w in
           on)
               a=$(($(sed -n "$i"p <<< "$ok2")-4))
               b=$(sed -n "$a"p <<< "$OK" | tr -d ' ')
               echo -e "\e[07;01;32;40m CloudFlare|ON \e[0m - \e[01;37m$b \e[0m"; sleep 1.5
               echo -e "$b" >> OK.txt
               rep=$(grep "$b" OK2.txt -c)
                case $rep in 1);; 0) echo "$b" >> OK2.txt; esac
               ;;
          off)
               a2=$(($(sed -n "$i"p <<< "$ok2")-4))
               b2=$(sed -n "$a2"p <<< "$OK" | tr -d ' ')
                 case $b2 in
                      none);;
                      *) echo -e "\e[01;37m CloudFlare|OFF\e[0m\e[02m - $b2 \e[0m"
                 esac
     esac
done
 case $eita in 
      1);;
      *) echo -e "\e[01;37m HOST utilizado - $HOST\e[0m\n"
         echo -e "$HOST" >> OK.txt; echo $(printf '=%.0s' {1..19}) >> OK.txt
 esac
echo -e "\e[01;37m Desea buscar otro host?\n\e[0m    [1] \e[0m\e[01;37mSI\e[0m | [2] \e[0m\e[01;37mNO\e[0m"
 while :; do
  read -n1 -p ": " OPC
   case $OPC in
        1) break;;
        2) exit;;
        *)
   esac
  done
done
