wget -q -O /etc/systemd/system/ws-tls.service "https://raw.githubusercontent.com/NevermoreSSH/hop/main/websocket/ws-tls.service" && chmod +x /etc/systemd/system/ws-tls.service
wget -q -O /usr/local/bin/ws-tls "https://raw.githubusercontent.com/NevermoreSSH/hop/main/websocket/ws-tls" && chmod +x /usr/local/bin/ws-tls
wget -q -O /etc/default/sslh "https://raw.githubusercontent.com/NevermoreSSH/FIX/main/sslh.sh" && chmod +x /etc/default/sslh
wget -q -O /etc/stunnel5/stunnel5.conf "https://raw.githubusercontent.com/NevermoreSSH/FIX/main/stunnel5.conf" && chmod +x /etc/stunnel5/stunnel5.conf
restart
