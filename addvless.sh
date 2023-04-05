#!/bin/bash
# By NevermoreSSH
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$( curl ipinfo.io/ip | grep $MYIP )
if [ $MYIP = $MYIP ]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
echo -e "${NC}${LIGHT}Fuck You!!"
exit 0
fi
clear
source /var/lib/crot/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
tls="$(cat ~/log-install.txt | grep -w "Vless TLS" | cut -d: -f2|sed 's/ //g')"
nontls="$(cat ~/log-install.txt | grep -w "Vless None TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Username : " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (Days) : " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#xray-vless-tls$/a\#### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#xray-vless-nontls$/a\#### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
xrayvless1="vless://${uuid}@${domain}:$tls?path=/vless/&security=tls&encryption=none&type=ws#${user}"
xrayvless2="vless://${uuid}@${domain}:$nontls?path=/vless/&encryption=none&type=ws#${user}"

# Config Set
vlesslink1="vless://${uuid}@${domain}:8443?type=ws&encryption=none&security=tls&host=${domain}&path=/vless/&allowInsecure=1&sni=${sni}#XRAY_VLESS_TLS_${user}"
vlesslink2="vless://${uuid}@${domain}:80?type=ws&encryption=none&security=none&host=${domain}&path=/vless/#XRAY_VLESS_NON_TLS_${user}"
umo1="vless://${uuid}@${MYIP}:80?type=ws&encryption=none&security=none&host=wap.u.com.my&path=/vless/#UMOWAP_${user}"
umo2="vless://${uuid}@${MYIP}:80?type=ws&encryption=none&security=none&host=pay-dcb.u.com.my&path=/vless/#UMOPAY_${user}"
umo3="vless://${uuid}@${MYIP}:80?type=ws&encryption=none&security=none&host=cdn.um.gz.net.my&path=/vless/#UMONET_${user}"
umo4="vless://${uuid}@${MYIP}:80?type=ws&encryption=none&security=none&host=maingame.com.my&path=/vless/#UMOGAME_${user}"
digi1="vless://${uuid}@api.useinsider.com:80?type=ws&encryption=none&security=none&host=${domain}&path=/vless/#DIGIBOOSTER_${user}"
digi2="vless://${uuid}@162.159.134.61:80?type=ws&encryption=none&security=none&host=${domain}&path=/vless/#DIGIBOOSTER2_${user}"
yes1="vless://${uuid}@cdn.who.int:80?type=ws&encryption=none&security=none&host=cdn.who.int.${domain}&path=/vless/#yes4g_${user}"
yes2="vless://${uuid}@cdn.who.int:80?type=ws&encryption=none&security=none&host=cdn.who.int&path=wss/${domain}/vless/#yesFB_${user}"
maxisip="vless://${uuid}@www.upnm.edu.my.${domain}:8443?type=ws&encryption=none&security=tls&host=${domain}&path=/vless/&allowInsecure=1&sni=mycampus.upnm.edu.my#MAXIS_IPHUNT_${user}"
maxistv1="vless://${uuid}@umc.viu.com.${domain}:80?type=ws&encryption=none&security=none&host=umc.viu.com.${domain}&path=/vless/#maxisTV_UMC_${user}"
maxistv2="vless://${uuid}@4gold.viu.com.${domain}:80?type=ws&encryption=none&security=none&host=4gold.viu.com.${domain}&path=/vless/#maxisTV_GOLD_${user}"
maxistv3="vless://${uuid}@adl-pccw.viu.com.${domain}:80?type=ws&encryption=none&security=none&host=adl-pccw.viu.com.${domain}&path=/vless/#maxisTV_PCCW_${user}"
maxistv4="vless://${uuid}@www.viu.com.${domain}:80?type=ws&encryption=none&security=none&host=www.viu.com.${domain}&path=/vless/#maxisTV_VIU_${user}"
yoodopubg="vless://${uuid}@${MYIP}:80?type=ws&encryption=none&security=none&host=www.pubgmobile.com&path=/vless/#yoodoPUBG_${user}"
yoodoml="vless://${uuid}@${MYIP}:80?type=ws&encryption=none&security=none&host=www.mobilelegends.com&path=/vless/#yoodoMLBB_${user}"
yoodobooster="vless://${uuid}@www.speedtest.net:80?type=ws&encryption=none&security=none&host=${domain}&path=/vless/#yoodoBOOSTER_${user}"
anybooster="vless://${uuid}@www.speedtest.net:80?type=ws&encryption=none&security=none&host=${domain}&path=/vless/#anyBOOSTER_${user}"
celcompubg="vless://${uuid}@${MYIP}:80?type=ws&encryption=none&security=none&host=www.pubgmobile.com&path=/vless/#celcomPUBG_${user}"
celcomml="vless://${uuid}@${MYIP}:80?type=ws&encryption=none&security=none&host=www.mobilelegends.com&path=/vless/#celcomMLBB_${user}"
celcomviu="vless://${uuid}@${MYIP}:80?type=ws&encryption=none&security=none&host=www.viu.com&path=/vless/#celcomVIU_${user}"
celcomyoutube="vless://${uuid}@${MYIP}:80?type=ws&encryption=none&security=none&host=www.youtube.com&path=/vless/#celcomYOUTUBE_${user}"
celcombooster="vless://${uuid}@www.speedtest.net:80?type=ws&encryption=none&security=none&host=${domain}&path=/vless/#celcomBOOSTER_${user}"


systemctl restart xray.service
service cron restart
clear
echo -e ""
echo -e "======-XRAYS/VLESS-======"
echo -e "Remarks     : ${user}"
echo -e "IP/Host     : ${MYIP}"
echo -e "Address     : ${domain}"
echo -e "Port TLS    : $tls"
echo -e "Port No TLS : $nontls"
echo -e "User ID     : ${uuid}"
echo -e "Encryption  : none"
echo -e "Network     : ws"
echo -e "Path        : /vless/"
echo -e "Created     : $hariini"
echo -e "Expired     : $exp"
echo -e "========================="
echo -e "Link TLS    : ${xrayvless1}"
echo -e "========================="
echo -e "Link No TLS : ${xrayvless2}"
echo -e "========================="
echo -e ""
echo -e "Script Mod By NevermoreSSH"
echo -e ""
echo -e "========================="
echo -e "Link UMOWAP  : ${umo1}"
echo -e "========================="
echo -e "Link UMOPAY  : ${umo2}"
echo -e "========================="
echo -e "Link UMONET  : ${umo3}"
echo -e "========================="
echo -e "Link UMOGAME : ${umo4}"
echo -e "========================="
echo -e "Link DIGI BOOST : ${digi1}"
echo -e "========================="
echo -e "Link DIGI2 BOOST : ${digi2}"
echo -e "========================="
echo -e "Link YES4G   : ${yes1}"
echo -e "========================="
echo -e "Link YESFB   : ${yes2}"
echo -e "========================="
echo -e "Link MAXIS IP : ${maxisip}"
echo -e "========================="
echo -e "Link MAXISTV UMC : ${maxistv1}"
echo -e "========================="
echo -e "Link MAXISTV GOLD : ${maxistv2}"
echo -e "========================="
echo -e "Link MAXISTV PCCW : ${maxistv3}"
echo -e "========================="
echo -e "Link MAXISTV VIU : ${maxistv4}"
echo -e "========================="
echo -e "Link YOODO PUBG : ${yoodopubg}"
echo -e "========================="
echo -e "Link YOODO ML : ${yoodoml}"
echo -e "========================="
echo -e "Link YOODO BOOST : ${yoodobooster}"
echo -e "========================="
echo -e "Link CELCOM PUBG : ${celcompubg}"
echo -e "========================="
echo -e "Link CELCOM ML : ${celcomml}"
echo -e "========================="
echo -e "Link CELCOM VIU : ${celcomviu}"
echo -e "========================="
echo -e "Link CECLOM YOUTUBE : ${celcomyoutube}"
echo -e "========================="
echo -e "Link CECLOM BOOSTER : ${celcombooster}"
echo -e "========================="
echo -e ""
echo -e "Script Mod By NevermoreSSH"
echo -e ""
