#!/bin/bash
o=active_ips.txt;>$o
read -p"Base IP prefix (e.g., 192.168.0.): " b;b=${b:-192.168.0.}
read -p"Start range (e.g., 2): " s;s=${s:-2}
read -p"End range (e.g., 254): " e;e=${e:-254}
[[ $s =~ ^[0-9]+$ ]]&&[[ $e =~ ^[0-9]+$ ]]&&[ $s -le $e ]||{ echo Invalid range;exit 1;}
a=();t=$((e-s+1));c=0
for i in $(seq $s $e);do ((c++));p=$b$i;pct=$((c*100/t));f=$((pct*50/100));bar=$(printf %${f}s|tr ' ' \#)$(printf %$((50-f))s|tr ' ' -);printf "\rPinging %s: [%s] %d%%" $p "$bar" $pct;ping -c1 -W1 $p>/dev/null 2>&1&&{ echo "$p is active">>$o;a+=($p);};done;echo
echo "Scan complete. Active IPs saved to $o."
[ ${#a[@]} -eq 0 ]&&echo No IPs responded.||{ echo Responding IPs:;printf %s\\n "${a[@]}";}
# Version 11
